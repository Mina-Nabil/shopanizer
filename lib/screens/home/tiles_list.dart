import 'package:flutter/material.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/screens/home/group_screen.dart';
import 'package:shopanizer/screens/home/list_screen.dart';
import 'package:shopanizer/screens/items/item_screen.dart';
import 'package:shopanizer/shared/widgets/empty_home.dart';
import 'package:shopanizer/shared/widgets/shopanizer_tile.dart';


class TilesList extends StatelessWidget {
  const TilesList(this.groups,this.lists,this.items);

  final List<ShopGroup> groups;
  final List<ShopList> lists;
  final List<ShopItem> items;

  @override
  Widget build(BuildContext context) {

    print("list count : ${lists.length}");
    print("item count : ${items.length}");

    List<Widget> tiles = groups.map((e) => ShopanizerTile.group(e,
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GroupScreen(e)),)
    )).toList();

    tiles.addAll(
      lists.map((e) => ShopanizerTile.list(e,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListScreen(e)),)
        )).toList()
    );

    tiles.addAll(
      items.map((e) => ShopanizerTile.item(e,
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
