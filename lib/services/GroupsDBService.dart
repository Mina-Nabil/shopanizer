import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/services/DatabaseService.dart';

class GroupsDBService extends DatabaseService {

  static const String groupsDocumentKey = "groups" ;

  GroupsDBService({userID}) :super(userID: userID);

  Stream<List<ShopGroup>> get groups {
    print("get groups");
    final Query<Map<String, dynamic>> userGroups = FirebaseFirestore.instance.collection(groupsDocumentKey).where('members', arrayContains: userID);
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

  Future? deleteGroup(groupID){
    final CollectionReference groupsCollection = FirebaseFirestore.instance.collection(groupsDocumentKey);
    groupsCollection.doc(groupID).delete();
  }
}
