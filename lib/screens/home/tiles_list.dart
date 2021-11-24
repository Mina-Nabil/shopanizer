import 'package:flutter/material.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/screens/home/list_screen.dart';
import 'package:shopanizer/screens/items/item_screen.dart';
import 'package:shopanizer/shared/widgets/empty_home.dart';
import 'package:shopanizer/shared/widgets/shopanizer_tile.dart';


class TilesList extends StatelessWidget {
  const TilesList(this.lists,this.items);

  final List<ShopList> lists;
  final List<ShoppingItem> items;

  @override
  Widget build(BuildContext context) {

    // List<ShoppingItem> items = [
    //   ShoppingItem(name: "Bedroom 1", categoryID: "1"),
    //   ShoppingItem(name: "Bedroom 2", categoryID: "1"),
    // ];

    print("list count : ${lists.length}");

    List<Widget> tiles = lists.map((e) => ShopanizerTile.list(e,
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListScreen(e)),)
    )).toList();

    tiles.addAll(
      items.map((e) => ShopanizerTile.item(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ItemScreen("1")),
      ))
    ).toList());

  print("tiles count : ${tiles.length}");
    return (tiles.length == 0)
        ? EmptyHomeWidget()
        : ListView(
            children: tiles.map((e) => Padding(padding: EdgeInsets.symmetric(vertical: 5),child: e,)).toList(),
          );
  }
}
