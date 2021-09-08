import 'package:flutter/material.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/circular_icon.dart';

class ShopanizerBreadCrumbs extends StatelessWidget {
  final String? groupName;
  final String? listName;
  final bool isIcon;

  ShopanizerBreadCrumbs.fromItem(ShoppingItem item, {this.isIcon = true})
      : groupName = item.groupName,
        listName = item.listName;
  ShopanizerBreadCrumbs(this.listName, this.groupName, {this.isIcon = true});
  ShopanizerBreadCrumbs.listOnly(this.listName, {this.isIcon = true}) : groupName = null;

  @override
  Widget build(BuildContext context) {
    List<Widget> breadCrumbs = [];
    if (listName != null) {
      if (isIcon)
        breadCrumbs.add(Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            child: CircularIcon(
                iconPath: Paths.addListIcon,
                iconColor: ShopColors.green,
                backgroundColor: ShopColors.green.withAlpha((.3 * 255).toInt()))));
      breadCrumbs.add(Text(listName!));
      if (groupName != null) {
        breadCrumbs.add(Text(" |"));
      }
    }
    if (groupName != null) {
      if (isIcon)
        breadCrumbs.add(Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            child: CircularIcon(
                iconPath: Paths.addGroupIcon,
                iconColor: ShopColors.blue,
                backgroundColor: ShopColors.blue.withAlpha((.3 * 255).toInt()))));
      breadCrumbs.add(Container(
            margin: (isIcon) ? EdgeInsets.all(0) : EdgeInsets.symmetric(horizontal: 6),
            child:Text(groupName!)));
    }

    return Container(
        margin: EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: breadCrumbs,
        ));
  }
}
