import 'package:cloud_firestore/cloud_firestore.dart';

class Group {


  static const String documentKey = "groups" ; 
  static const String nameKey = "name" ; 
  static const String descKey = "desc" ; 
  static const String imageURLKey = "image" ; 

  late String name;
  late String desc;
  late String id;

  Group(this.id, this.name, this.desc);

  Group.fromSnapshot(QueryDocumentSnapshot qds) : 
    this.id = qds.id,
    this.name = qds[nameKey],
    this.desc = qds[descKey];
  
}