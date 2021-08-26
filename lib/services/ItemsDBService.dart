import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopanizer/models/category.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/services/DatabaseService.dart';

class ItemsDBService extends DatabaseService {
  ItemsDBService({userID}) : super(userID: userID);

  final CollectionReference itemsCollection =
      FirebaseFirestore.instance.collection(ShoppingItem.documentKey); //.where('userID',?)

  final CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection(Category.documentKey);

  Stream<List<ShoppingItem>> get items {
    return itemsCollection.snapshots().map(_itemsFromSnapshot);
  }

  Future<List<Category>> get categories async {
    return await categoriesCollection.get().then((qs) => qs.docs.map((e) => Category.fromSnapshot(e)).toList());
  }

  List<ShoppingItem> _itemsFromSnapshot(QuerySnapshot qs) {
    return qs.docs.map((e) => new ShoppingItem.fromQuerySnapshots(e)).toList();
  }

  setItemData(
      {String? itemID,
      required String name,
      required String catgID,
      String? desc,
      double? price,
      String? brand,
      List<String> urls = const [],
      List<String> locations = const [],
      List<String> fbs = const [],
      List<String> instas = const []}) {
    itemsCollection.doc(itemID).set({
      ShoppingItem.nameKey: name,
      ShoppingItem.categoryIDKey: catgID,
      ShoppingItem.descKey: desc,
      ShoppingItem.priceKey: price,
      ShoppingItem.brandKey: brand,
      ShoppingItem.urlsListKey: urls,
      ShoppingItem.locationListKey: locations,
      ShoppingItem.facebookListKey: fbs,
      ShoppingItem.instagramListKey: instas,
    });
  }
}
