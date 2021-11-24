
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopanizer/models/list_model.dart';

class UserDatabaseServive {
    Future updateUserData(String firstName, String lastName, String email) async {
    final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    return await userCollection.doc(uid).set({
      'firstName': firstName,
      'lastName' : lastName,
      'email'    : email,
      'groups'   : []
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

  static Future<String> createNewList(String parentId, ShopList list) async {
    // add the new list to listCollection
    final CollectionReference listCollection = FirebaseFirestore.instance.collection('listCollection');
    DocumentReference listDocRef = await listCollection.add(list.toJson());

    print("list created with id = "+ listDocRef.id);

    return listDocRef.id;
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
    String newListId = await createNewList(parentId, list);
    addListToList(parentId, newListId);
    return getListById(newListId);
  }
}