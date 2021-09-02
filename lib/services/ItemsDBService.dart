import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopanizer/models/category.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/services/DatabaseService.dart';

class ItemsDBService extends DatabaseService {
  ItemsDBService({userID}) : super(userID: userID);

  final CollectionReference itemsCollection =
      FirebaseFirestore.instance.collection(ShoppingItem.documentKey); //.where('userID',?)

  final CollectionReference categoriesCollection = FirebaseFirestore.instance.collection(ShoppingCategory.documentKey);

  Stream<List<ShoppingItem>> get items {
    return itemsCollection.snapshots().map(_itemsFromSnapshot);
  }

  Future<List<ShoppingCategory>> get categories async {
    return await categoriesCollection.get().then((qs) => qs.docs.map((e) => ShoppingCategory.fromSnapshot(e)).toList());
  }

  Future<ShoppingItem>? getFullItemById(String itemID) async {
    DocumentSnapshot ds = await itemsCollection.doc(itemID).get();
    if(ds.exists)
      return ShoppingItem.fromSnapshot(await itemsCollection.doc(itemID).get());
    else throw Exception("Document Not Found");
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
