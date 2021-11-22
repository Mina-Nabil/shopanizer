import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/screens/home/list_screen.dart';
import 'package:shopanizer/services/GroupsDBService.dart';
import 'package:shopanizer/shared/widgets/empty_home.dart';
import 'package:shopanizer/shared/widgets/shopanizer_tile.dart';


class ListsList extends StatefulWidget {
  const ListsList(this.ids);
  final List<String> ids;
  @override
  _ListsListState createState() => _ListsListState();
}

class _ListsListState extends State<ListsList> {

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      Provider.of<ListsProvider>(context, listen: false).loadListsById(widget.ids);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ShopList> lists = Provider.of<ListsProvider>(context, listen: true).lists;
    print("list count : ${lists.length}");
    return (lists.length == 0)
        ? EmptyHomeWidget()
        : ListView(
            children: lists.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child:  ShopanizerTile.list(e,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListScreen(e)))),
            )).toList(),
          );
  }
}
