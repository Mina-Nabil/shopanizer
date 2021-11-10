import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopanizer/models/category.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/models/shopper.dart';
class ItemsDBService {
  final userID = FirebaseAuth.instance.currentUser!.uid;
  final CollectionReference itemsCollection =
      FirebaseFirestore.instance.collection(ShoppingItem.documentKey); //.where('userID',?)

  final CollectionReference categoriesCollection = FirebaseFirestore.instance.collection(ShoppingCategory.documentKey);

  final CollectionReference loversCollection =
      FirebaseFirestore.instance.collection(ShoppingItem.loversDocumentKey); //whereItemID

  Stream<List<ShoppingItem>> get items {
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

  Future<ShoppingItem>? getFullItemById(String itemID) async {
    DocumentSnapshot ds = await itemsCollection.doc(itemID).get();
    if (ds.exists)
      return ShoppingItem.fromSnapshot(await itemsCollection.doc(itemID).get());
    else
      throw Exception("Document Not Found");
  }

  List<ShoppingItem> _itemsFromSnapshot(QuerySnapshot qs) {
    return qs.docs.map((e) => new ShoppingItem.fromSnapshot(e)).toList();
  }

  setItemData(ShoppingItem item) {
    itemsCollection.doc().set({
      ShoppingItem.nameKey: item.name,
      ShoppingItem.categoryIDKey: item.catgID,
      ShoppingItem.descKey: item.desc,
      ShoppingItem.priceKey: item.price,
      ShoppingItem.brandKey: item.brand,
      ShoppingItem.urlsListKey: item.urls,
      ShoppingItem.locationListKey: item.locations,
      ShoppingItem.facebookListKey: item.fbs,
      ShoppingItem.instagramListKey: item.instas,
    });
  }
}
