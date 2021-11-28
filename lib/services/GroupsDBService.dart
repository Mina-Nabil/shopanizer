import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/services/DatabaseService.dart';
class CurrentUser with ChangeNotifier {

  CurrentUser() {
    print("CurrentUser Provider is created");
  }

  String _name = "";
  List<ShopGroup> _groups = [];
  List<ShopList> _lists = [];

  Future<void> loadGroups() async {

    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference userDocRef =  FirebaseFirestore.instance.collection('users').doc(userId);
    DocumentSnapshot qds = await userDocRef.get();
    
    _name = qds.get('firstName');
    
    print("load user groups/lists");
    
    _groups = [];
    _lists = [];

    
    print("user id is " + userId);

    
    
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

  String get name {
    return _name;
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
