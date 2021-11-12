import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/models/list_model.dart';
class GroupsDBService  {

  static const String groupsDocumentKey = "groups" ;

  Stream<List<ShopGroup>> get groups {
    print("get groups");
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final Query<Map<String, dynamic>> userGroups = FirebaseFirestore.instance.collection(groupsDocumentKey).where('members', arrayContains: userId);
    return userGroups.snapshots().map(_groupsFromSnapshot);
  }

  Future<ShopGroup> addNewGroup(ShopGroup group) async {
    final CollectionReference groupsCollection = FirebaseFirestore.instance.collection(groupsDocumentKey);
    DocumentReference docRef = await groupsCollection.add(group.toJson());
    DocumentSnapshot qds = await docRef.get();
    return ShopGroup.fromSnapshot(qds);
  }

  List<ShopGroup> _groupsFromSnapshot(QuerySnapshot qs) {
    return qs.docs.map((e) => new ShopGroup.fromSnapshot(e)).toList();
  }

  List<ShopList> _listsFromSnapshot(QuerySnapshot qs) {
    return qs.docs.map((e) => new ShopList.fromSnapshot(e)).toList();
  }
  Future? deleteGroup(groupID){
    final CollectionReference groupsCollection = FirebaseFirestore.instance.collection(groupsDocumentKey);
    groupsCollection.doc(groupID).delete();
  }

  void addListToGroup(String groupPath, ShopList list) {
      String listCollectionPath = groupPath + '/lists';

    final CollectionReference listCollection = FirebaseFirestore.instance.collection(listCollectionPath);
    listCollection.add(list.toJson());
  }

  
  Stream<List<ShopList>> listIngroup(String groupPath) {
    print("get listIngroup");
    String listCollectionPath = groupPath + '/lists';
    final CollectionReference listCollection = FirebaseFirestore.instance.collection(listCollectionPath);
    return listCollection.snapshots().map(_listsFromSnapshot);
  }


}
