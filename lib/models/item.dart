import 'package:cloud_firestore/cloud_firestore.dart';

class ShopItem {
  static const String documentKey = "items";
  static const String loversDocumentKey = "itemsUsers";

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

  String? _id;
  String _name;
  String _catgID;
  String? _desc;
  late List<double> _price;
  late List<String> _brand;
  late List<String> _images;
  late List<String> _urls;
  late List<String> _locations;
  late List<String> _fbs;
  late List<String> _instas;
  String? _groupName;
  String? _listName;
  bool? _isLoved;
  List<String>? _lovers;

  ShopItem({
    required String name,
    required String categoryID,
    String? id,
    String? desc,
    List<double>? price,
    List<String>? brand,
    List<String>? images,
    List<String>? urls,
    List<String>? locations,
    List<String>? fbs,
    List<String>? instas,
    String? groupName,
    String? listName,
  })  : _name = name,
        _catgID = categoryID,
        _desc = desc,
        _id = id,
        _price = price ?? [],
        _brand = brand ?? [],
        _images = images ?? [],
        _urls = urls ?? [],
        _locations = locations ?? [],
        _fbs = fbs ?? [],
        _instas = instas ?? [],
        _groupName = groupName,
        _listName = listName;

  ShopItem.fromSnapshot(DocumentSnapshot qds)
      : _id = qds.id,
        _name = qds[nameKey],
        _catgID = qds[categoryIDKey],
        _desc = qds[descKey] {
    try {
      _desc = qds[descKey];
    } catch (e) {
      _desc = null;
    }
    try {
      _brand = qds[brandKey].cast<String>();
    } catch (e) {
      _brand = [];
    }
    try {
      _price = qds[priceKey].cast<double>() ?? [];
    } catch (e) {
      _price = [];
    }
    try {
      _images = qds[imagesListKey].cast<String>() ?? [];
    } catch (e) {
      _images = [];
    }
    try {
      _urls = qds[urlsListKey].cast<String>() ?? [];
    } catch (e) {
      _urls = [];
    }
    try {
      _locations = qds[locationListKey].cast<String>() ?? [];
    } catch (e) {
      _locations = [];
    }
    try {
      _fbs = qds[facebookListKey].cast<String>() ?? [];
    } catch (e) {
      _fbs = [];
    }
    try {
      _instas = qds[instagramListKey].cast<String>() ?? [];
    } catch (e) {
      _instas = [];
    }
    _listName = "Hamada";
    _groupName = "3zo";
  }

  // Future<bool> like() {}

  String? get id {
    return _id;
  }
  String get name {
    return _name;
  }

  String get catgID {
    return _catgID;
  }

  String? get desc {
    return _desc;
  }

  String? get groupName {
    return _groupName;
  }

  String? get listName {
    return _listName;
  }

  List<double> get price {
    return _price;
  }

  double get avgPrice {
    double ret = 0;
    int i = 0;
    _price.forEach((e) {
      i++;
      ret = (e + ret) / i;
    });
    return ret;
  }

  double get maxPrice {
    double ret = 0;
    _price.forEach((e) {
      if (e > ret) ret = e;
    });
    return ret;
  }

  double get minPrice {
    double ret = double.infinity;
    _price.forEach((e) {
      if (e < ret) ret = e;
    });
    return ret;
  }

  List<String> get brand {
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
