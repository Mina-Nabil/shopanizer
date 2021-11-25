import 'package:cloud_firestore/cloud_firestore.dart';

import 'group.dart';

class ShopList extends ShopModel {
  
  ShopList({
    this.id ="",
    required this.name,
    this.desc = "",
    this.photo = ""
  });



  ShopList.fromSnapshot(DocumentSnapshot docSnapshot) :
    this.id = docSnapshot.id,
    this.name = docSnapshot['name'],
    this.desc = docSnapshot['desc'],
    this.photo = docSnapshot['photo'],
    this.lists = (docSnapshot['lists'] as List<dynamic>).cast<String>(),
    this.items = (docSnapshot['items'] as List<dynamic>).cast<String>();
  

  String id = "";
  String name;
  String desc;
  String photo;
  List<String> lists = [];
  List<String> items = [];


  @override
  Map<String, dynamic> toJson() {
    return {
      'name'  : name,
      'desc'  : desc,
      'photo' : photo,
      'lists' : lists,
      'items' : items,
    };
  }
}