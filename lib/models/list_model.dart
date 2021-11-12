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
    this.photo = ""/*docSnapshot['photo']*/;
  

  String id = "";
  String name;
  String desc;
  String photo;


  @override
  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'desc' : desc,
      'photo' : photo,
    };
  }
}