import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingCategory {

  static const String documentKey = "categories" ; 
  static const String nameKey = "name" ; 
  static const String descKey = "desc" ; 
  static const String valueKey = "value" ; 

  String name;
  String desc;
  String id;
  int value;

  ShoppingCategory(this.id, this.name, this.desc, this.value) ;

  ShoppingCategory.fromSnapshot(DocumentSnapshot qds) :
    this.id = qds.id,
    this.name = qds[nameKey],
    this.desc = qds[descKey],
    this.value = qds[valueKey];

}