import 'package:flutter/material.dart';
import 'package:shopanizer/models/group.dart';

class GroupTile extends StatelessWidget {
  final Group group;

  const GroupTile(this.group);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(group.id),
          Text(" ") ,
          Text(group.name),
          Text(" ") ,
          Text(group.desc),
        ],
      ),
    );
  }
}
