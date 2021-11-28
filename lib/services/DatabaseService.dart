
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/models/list_model.dart';

class UserDatabaseServive {
    Future updateUserData(String firstName, String lastName, String email) async {
    final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    return await userCollection.doc(uid).set({
      'firstName': firstName,
      'lastName' : lastName,
      'email'    : email,
      'groups'   : [],
      'lists'    : [],
    });
  }
}


class DatabaseHelper {
  
  static Future<List<ShopList>> getListsById(List<String> ids) async {
    List<ShopList> lists = [];
    print("get lists of ids: " + ids.toString());
    
    final CollectionReference listCollection = FirebaseFirestore.instance.collection('listCollection');
    for (var listId in ids) {
      //check if this list is loaded before
      DocumentSnapshot docSnapshot = await listCollection.doc(listId).get();
      lists.add(ShopList.fromSnapshot(docSnapshot));
    }
    return lists;
  }

  static Future<ShopList> getListById(String id) async {
    print("get list of id: " + id);
    
    final CollectionReference listCollection = FirebaseFirestore.instance.collection('listCollection');
    DocumentSnapshot docSnapshot = await listCollection.doc(id).get();
    return ShopList.fromSnapshot(docSnapshot);
  }

  static Future<String> createNewList(ShopList list) async {
    // add the new list to listCollection
    final CollectionReference listCollection = FirebaseFirestore.instance.collection('listCollection');
    DocumentReference listDocRef = await listCollection.add(list.toJson());

    print("list created with id = "+ listDocRef.id);

    return listDocRef.id;
   }

  // users private lists
  static Future<ShopList> createNewUserList(String parentId, ShopList list) async {
    String newListId = await createNewList(list);
    addListToUser(parentId, newListId);
    return getListById(newListId);
  }

  static void addListToUser(String userId, String listId) {
    
    //add list id to list's lists array
    FirebaseFirestore.instance.collection('users').doc(userId).update(
      {
        'lists' : FieldValue.arrayUnion([listId])
      }
    );
  }

  static void addListToList(String parentId, String listId) {
    
    //add list id to list's lists array
    FirebaseFirestore.instance.collection('listCollection').doc(parentId).update(
      {
        'lists' : FieldValue.arrayUnion([listId])
      }
    );
  }

  static Future<ShopList> createNewListInList(String parentId, ShopList list) async {
    String newListId = await createNewList(list);
    addListToList(parentId, newListId);
    return getListById(newListId);
  }




  //Items related fucntions

  static Future<ShopItem> getItemById(String id) async {
    print("get item of id: " + id);
    
    final CollectionReference listCollection = FirebaseFirestore.instance.collection('itemCollection');
    DocumentSnapshot docSnapshot = await listCollection.doc(id).get();
    return ShopItem.fromSnapshot(docSnapshot);
  }

  static Future<List<ShopItem>> getItemsById(List<String> ids) async {
    
    print("get items of ids: " + ids.toString());
    List<ShopItem> items = [];
    final CollectionReference itemCollection = FirebaseFirestore.instance.collection('itemCollection');
    for (var itemId in ids) {
      //check if this list is loaded before
      DocumentSnapshot docSnapshot = await itemCollection.doc(itemId).get();
      items.add(ShopItem.fromSnapshot(docSnapshot));
    }
    return items;
  }

  static Future<ShopItem> createNewItemInList(String parentId, ShopItem item) async {
    String newItemId = await _createNewItem(item);
    _addItemToList(parentId, newItemId);
    return getItemById(newItemId);
  }

  static void _addItemToList(String parentId, String ItemId) {
    
    print("add item $ItemId to list $parentId");

    //add list id to list's lists array
    FirebaseFirestore.instance.collection('listCollection').doc(parentId).update(
      {
        'items' : FieldValue.arrayUnion([ItemId])
      }
    );
  }

  static Future<String> _createNewItem(ShopItem item) async {
    // add the new list to listCollection
    final CollectionReference itemCollection = FirebaseFirestore.instance.collection('itemCollection');
    DocumentReference itemDocRef = await itemCollection.add({
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

    print("Item created with id = "+ itemDocRef.id);

    return itemDocRef.id;
  }
}