import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopanizer/services/GroupsDBService.dart';

abstract class ShopModel {
  Map<String, dynamic> toJson();
}
class ShopGroup extends ShopModel{

  ShopGroup({required this.name, this.desc="", this.groupPhoto="", required this.members});

  ShopGroup.fromSnapshot(DocumentSnapshot qds) :
    this.id = qds.id,
    this.name = qds[GroupFSKeys.name],
    this.groupPhoto = qds[GroupFSKeys.photo],
    this.members = (qds[GroupFSKeys.members] as List<dynamic>).cast<String>(),
    this.lists = (qds['lists'] as List<dynamic>).cast<String>(),
    this.desc = qds[GroupFSKeys.desc];

  String id="";
  String name;
  String desc;
  String groupPhoto;
  List<String> members;
  List<String> lists = [];

  @override
  Map<String, dynamic> toJson() {
    return
    {
      GroupFSKeys.name    : name,
      GroupFSKeys.desc    : desc,
      GroupFSKeys.photo   : groupPhoto,
      GroupFSKeys.members : members,
      GroupFSKeys.lists   : lists,
    };
  }

  String path() {
    return  GroupsDBService.groupsDocumentKey + '/'+ id;
  }
}

class GroupFSKeys {

  static const String name = "name" ;
  static const String desc = "desc" ;
  static const String photo = "group_photo" ;
  static const String members = "members" ;
  static const String lists   = "lists" ;
}