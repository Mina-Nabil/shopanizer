import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopanizer/models/group.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference groupsCollection = FirebaseFirestore.instance.collection("groups"); //.where('userID',?)

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
