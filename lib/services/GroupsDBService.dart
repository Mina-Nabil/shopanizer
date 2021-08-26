import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/services/DatabaseService.dart';

class GroupsDBService extends DatabaseService {
  GroupsDBService({userID}) :super(userID: userID);



  final CollectionReference groupsCollection = FirebaseFirestore.instance.collection(Group.documentKey); //.where('userID',?)

  Stream<List<Group>> get groups {
    return groupsCollection.snapshots().map(_groupsFromSnapshot);
  }

  Future? addNewGroup(String name, String desc) async {
    return groupsCollection.doc().set({
      "name": name,
      "desc": desc,
    });
  }

  List<Group> _groupsFromSnapshot(QuerySnapshot qs) {
    return qs.docs.map((e) => new Group.fromSnapshot(e)).toList();
  }

  Future? deleteGroup(groupID){
    groupsCollection.doc(groupID).delete();
  }
}
