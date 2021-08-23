import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  late String name;
  late String desc;
  late String id;

  Group(this.id, this.name, this.desc);

  Group.fromSnapshot(QueryDocumentSnapshot qds){
    this.id = qds.id;
    this.name = qds['name'];
    this.desc = qds['desc'];
  }
}