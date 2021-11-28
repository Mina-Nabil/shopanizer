import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/services/DatabaseService.dart';
class GroupsDBService  {

  static const String groupsDocumentKey = "groups" ;

  // Stream<List<ShopGroup>> get groups {
  //   print("get groups");
  //   String userId = FirebaseAuth.instance.currentUser!.uid;
  //   final Query<Map<String, dynamic>> userGroups = FirebaseFirestore.instance.collection(groupsDocumentKey).where('members', arrayContains: userId);
  //   return userGroups.snapshots().map(_groupsFromSnapshot);
  // }

  // Future<ShopGroup> addNewGroup(ShopGroup group) async {


  //   final CollectionReference groupsCollection = FirebaseFirestore.instance.collection(groupsDocumentKey);
  //   DocumentReference docRef = await groupsCollection.add(group.toJson());
  //   DocumentSnapshot qds = await docRef.get();

  //   final CollectionReference newGroupsCollection = FirebaseFirestore.instance.collection('groupsCollection');
  //   DocumentReference groupDocRef = await newGroupsCollection.add(group.toJson());
    
  //   FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
  //     'groups' : FieldValue.arrayUnion([groupDocRef.id])
  //   });

  //   return ShopGroup.fromSnapshot(qds);
  // }

  // List<ShopGroup> _groupsFromSnapshot(QuerySnapshot qs) {
  //   return qs.docs.map((e) => new ShopGroup.fromSnapshot(e)).toList();
  // }

  // List<ShopList> _listsFromSnapshot(QuerySnapshot qs) {
  //   return qs.docs.map((e) => new ShopList.fromSnapshot(e)).toList();
  // }
  // Future? deleteGroup(groupID){
  //   final CollectionReference groupsCollection = FirebaseFirestore.instance.collection(groupsDocumentKey);
  //   groupsCollection.doc(groupID).delete();
  // }

  // void addListToGroup(String groupPath, ShopList list) {
  //   String listCollectionPath = groupPath + '/lists';
  //   final CollectionReference listCollection = FirebaseFirestore.instance.collection(listCollectionPath);
  //   listCollection.add(list.toJson());
  // }

  
  // Stream<List<ShopList>> listIngroup(String groupPath) {
  //   print("get listIngroup");
  //   String listCollectionPath = groupPath + '/lists';
  //   final CollectionReference listCollection = FirebaseFirestore.instance.collection(listCollectionPath);
  //   return listCollection.snapshots().map(_listsFromSnapshot);
  // }


}

class CurrentUser with ChangeNotifier {

  CurrentUser() {
    print("CurrentUser Provider is created");
  }

  List<ShopGroup> _groups = [];
  List<ShopList> _lists = [];

  Future<void> loadGroups() async {
    print("load user groups/lists");
    
    _groups = [];
    _lists = [];

    String userId = FirebaseAuth.instance.currentUser!.uid;
    print("user id is " + userId);

    DocumentReference userDocRef =  FirebaseFirestore.instance.collection('users').doc(userId);
    DocumentSnapshot qds = await userDocRef.get();
    List<dynamic> groupsRef;
    
    try {
      groupsRef = qds['groups'];
    } catch (e) {
      print("found no groups");
      groupsRef = [];
    }

    print(groupsRef);
    for (String groupID in groupsRef) {
      //should be in try catch
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('groupCollection').doc(groupID).get();
      _groups.add( ShopGroup.fromSnapshot(documentSnapshot));
    }


    //lists
    List<dynamic> listsRef;
    
    try {
      listsRef = qds['lists'];
    } catch (e) {
      print("found no lists");
      listsRef = [];
    }

    print(listsRef);
    for (String listID in listsRef) {
      //should be in try catch
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('listCollection').doc(listID).get();
      _lists.add( ShopList.fromSnapshot(documentSnapshot));
    }

    notifyListeners();
  }

  Future<ShopGroup> addNewGroup(ShopGroup group) async {

    //add the new group to groupCollection
    final CollectionReference newGroupsCollection = FirebaseFirestore.instance.collection('groupCollection');
    DocumentReference groupDocRef = await newGroupsCollection.add(group.toJson());
    
    //add new group id to user groups array
    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
      'groups' : FieldValue.arrayUnion([groupDocRef.id])
    });

    //return the new group
    DocumentSnapshot documentSnapshot = await groupDocRef.get();
    ShopGroup g = ShopGroup.fromSnapshot(documentSnapshot);
    _groups.add(g);
    notifyListeners();
    return g;
  }

  List<ShopGroup> get groups {
    return _groups;
  }

  List<ShopList> get lists {
    return _lists;
  }


  void addNewList(ShopList list) {
    _lists.add(list);
    notifyListeners();
  }

  Future<ShopList> addListToGroup(String groupId, ShopList list) async {

    String newListId = await DatabaseHelper.createNewList(list);
    print("list added with id = "+ newListId);
    
    //add list id to group's lists array
    FirebaseFirestore.instance.collection('groupCollection').doc(groupId).update(
      {
        'lists' : FieldValue.arrayUnion([newListId])
      }
    );

    //add list id to local version of group
    _groups.firstWhere((element) => element.id == groupId).lists.add(newListId);

    //notify and return the new list object
    notifyListeners();

    return await DatabaseHelper.getListById(newListId);
  }

}
