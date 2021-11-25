import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopanizer/models/category.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/models/shopper.dart';
class ItemsDBService {
  final userID = FirebaseAuth.instance.currentUser!.uid;
  final CollectionReference itemsCollection =
      FirebaseFirestore.instance.collection(ShopItem.documentKey); //.where('userID',?)

  final CollectionReference categoriesCollection = FirebaseFirestore.instance.collection(ShoppingCategory.documentKey);

  final CollectionReference loversCollection =
      FirebaseFirestore.instance.collection(ShopItem.loversDocumentKey); //whereItemID

  Stream<List<ShopItem>> get items {
    return itemsCollection.snapshots().map(_itemsFromSnapshot);
  }

  Future<List<Shopper>> getLovers(itemID) async {
    try {
      DocumentSnapshot qs = await loversCollection.doc(itemID).get();
      if (qs.exists) {
        return qs["lovers"].map((e) => Shopper.fromSnapshot(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<bool> likeItem(itemID) async {
    bool success = false;
    await loversCollection.doc(itemID).update({
      "lovers": FieldValue.arrayUnion([userID])
    }).then((value) => success = true);
    return success;
  }

  Future<List<ShoppingCategory>> get categories async {
    try {
      return await categoriesCollection.get().then((qs) => qs.docs.map((e) => ShoppingCategory.fromSnapshot(e)).toList());
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<ShopItem>? getFullItemById(String itemID) async {
    DocumentSnapshot ds = await itemsCollection.doc(itemID).get();
    if (ds.exists)
      return ShopItem.fromSnapshot(await itemsCollection.doc(itemID).get());
    else
      throw Exception("Document Not Found");
  }

  List<ShopItem> _itemsFromSnapshot(QuerySnapshot qs) {
    return qs.docs.map((e) => new ShopItem.fromSnapshot(e)).toList();
  }

  setItemData(ShopItem item) {
    itemsCollection.doc().set({
      ShopItem.nameKey: item.name,
      ShopItem.categoryIDKey: item.catgID,
      ShopItem.descKey: item.desc,
      ShopItem.priceKey: item.price,
      ShopItem.brandKey: item.brand,
      ShopItem.urlsListKey: item.urls,
      ShopItem.locationListKey: item.locations,
      ShopItem.facebookListKey: item.fbs,
      ShopItem.instagramListKey: item.instas,
    });
  }
}
