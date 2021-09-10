import 'package:cloud_firestore/cloud_firestore.dart';

class Shopper {
  String name;
  String id;

  Shopper(this.id, this.name);

  Shopper.fromSnapshot(DocumentSnapshot ds)
      : name = ds["name"],
        id = ds.id;
}
