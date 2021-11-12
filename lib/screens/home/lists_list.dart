import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/screens/home/list_screen.dart';
import 'package:shopanizer/shared/widgets/empty_home.dart';
import 'package:shopanizer/shared/widgets/shopanizer_tile.dart';


class ListsList extends StatefulWidget {
  const ListsList({Key? key}) : super(key: key);

  @override
  _ListsListState createState() => _ListsListState();
}

class _ListsListState extends State<ListsList> {
  List<ShopList> _lists = [];

  @override
  void didChangeDependencies() {
    _lists = Provider.of<List<ShopList>>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return (_lists.length == 0)
        ? EmptyHomeWidget()
        : ListView(
            children: _lists.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child:  ShopanizerTile.list(e,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListScreen(e)))),
            )).toList(),
          );
  }
}
