import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingItem {
  static const String documentKey = "items";
  static const String nameKey = "name";
  static const String descKey = "desc";
  static const String categoryIDKey = "catgID";
  static const String imagesListKey = "images";
  static const String priceKey = "price";
  static const String brandKey = "brand";
  static const String urlsListKey = "urls";
  static const String locationListKey = "locations";
  static const String facebookListKey = "fbs";
  static const String instagramListKey = "instas";

  String _name;
  String _catgID;
  String? _desc;
  double? _price;
  String? _brand;
  List<String> _images;
  List<String> _urls;
  List<String> _locations;
  List<String> _fbs;
  List<String> _instas;

  ShoppingItem(
      {required String name,
      required String categoryID,
      String? desc,
      double? price,
      String? brand,
      List<String>? images,
      List<String>? urls,
      List<String>? locations,
      List<String>? fbs,
      List<String>? instas})
      : _name = name,
        _catgID = categoryID,
        _desc = desc,
        _price = price,
        _brand = brand,
        _images = images ?? [],
        _urls = urls ?? [],
        _locations = locations ?? [],
        _fbs = fbs ?? [],
        _instas = instas ?? [];

  ShoppingItem.fromQuerySnapshots(QueryDocumentSnapshot qds)
      : _name = qds[nameKey],
        _catgID = qds[categoryIDKey],
        _desc = qds[descKey],
        _price = qds[priceKey],
        _brand = qds[brandKey],
        _images = qds[imagesListKey] ?? [],
        _urls = qds[urlsListKey] ?? [],
        _locations = qds[locationListKey] ?? [],
        _fbs = qds[facebookListKey] ?? [],
        _instas = qds[instagramListKey] ?? [];

  String get name {
    return _name;
  }

  String get catgID {
    return _catgID;
  }

  String? get desc {
    return _desc;
  }

  double? get price {
    return _price;
  }

  String? get brand {
    return _brand;
  }

  List<String> get images {
    return _images;
  }

  List<String> get locations {
    return _locations;
  }

  List<String> get urls {
    return _urls;
  }

  List<String> get fbs {
    return _fbs;
  }

  List<String> get instas {
    return _instas;
  }
}
