import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/screens/home/empty_home.dart';
import 'package:shopanizer/screens/home/group_tile.dart';


class GroupsList extends StatefulWidget {
  const GroupsList({Key? key}) : super(key: key);

  @override
  _GroupsListState createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  List<Group> _groups = [];

  @override
  void didChangeDependencies() {
    _groups = Provider.of<List<Group>>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return (_groups.length == 0)
        ? EmptyHomeWidget()
        : ListView(
            children: _groups.map((e) => GroupTile(e)).toList(),
          );
  }
}
