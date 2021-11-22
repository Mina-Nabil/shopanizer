
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopanizer/services/GroupsDBService.dart';
import 'package:shopanizer/shared/widgets/empty_home.dart';
import 'package:shopanizer/shared/widgets/shopanizer_tile.dart';


class GroupsList extends StatefulWidget {
  const GroupsList({Key? key}) : super(key: key);

  @override
  _GroupsListState createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {

@override
  void initState() {
    super.initState();
    Provider.of<GroupsProvider>(context, listen: false).loadGroups();
  }

  @override
  Widget build(BuildContext context) {
    var groups = Provider.of<GroupsProvider>(context, listen: true).groups;
    return (groups.length == 0)
        ? EmptyHomeWidget()
        : ListView(
            children: groups.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child:  ShopanizerTile.group(e,
                onPressed: () =>Navigator.pushNamed(context, '/group', arguments: e),
              ),
            )).toList(),
          );
  }
}
