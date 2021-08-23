import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/screens/home/group_tile.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';

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
        ? Center(
            child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    child: SvgPicture.asset(Paths.emptyHomeIcon)),
                Text("You have no groups or lists yet!"),
                Text(
                  "Organize your shopping and start now",
                  style: TextStyle(color: ShopColors.primary, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ))
        : ListView(
            children: _groups.map((e) => GroupTile(e)).toList(),
          );
  }
}
