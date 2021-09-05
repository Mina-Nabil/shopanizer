import 'package:flutter/material.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/services/ItemsDBService.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:shopanizer/shared/widgets/category_label.dart';
import 'package:shopanizer/shared/widgets/circular_icon.dart';

class ItemScreen extends StatefulWidget {
  static const String screenName = "ShowScreen";
  final String itemID;
  const ItemScreen(this.itemID);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  //Screen dimensions
  static const double _titlePlaceholderWidthRatio = 2.5;
  static const double _breadCrumbsPlaceholderWidthRatio = _titlePlaceholderWidthRatio / 1.2;

  ShoppingItem? item;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) async {
      try {
        item = await ItemsDBService().getFullItemById(widget.itemID);
      } catch (e) {
        item = null;
      }
      if (this.mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: RoundedCornerButton.text(text: "Edit", backgroundColor: ShopColors.blue, onPressed: () {}))
        ],
      ),
      body: ListView(
        children: [
          buildTitleWidget(),
          buildBreadCrumbs(),
        ],
      ),
    );
  }

  Widget buildTitleWidget() {
    if (item == null) {
      return Center(
        child: Container(
            width: MediaQuery.of(context).size.width / _titlePlaceholderWidthRatio,
            margin: EdgeInsets.all(12),
            child: PlaceholderLines(
              count: 1,
              animate: true,
              lineHeight: 24,
              align: TextAlign.center,
              maxOpacity: 0.3,
              minOpacity: 0.1,
              color: ShopColors.primary,
            )),
      );
    } else {
      return Center(child: TitleTV1(text: item!.name));
    }
  }

  Widget buildBreadCrumbs() {
    List<Widget> breadCrumbs = [];
    if (item == null) {
      return Center(
          child: Container(
              width: MediaQuery.of(context).size.width / _breadCrumbsPlaceholderWidthRatio,
              margin: EdgeInsets.all(12),
              child: PlaceholderLines(
                animate: true,
                count: 2,
                lineHeight: 12,
                maxOpacity: 0.3,
                minOpacity: 0.1,
                align: TextAlign.center,
                color: ShopColors.blue,
              )));
    } else {
      if (item!.listName != null) {
        breadCrumbs.add(Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            child: CircularIcon(
                iconPath: Paths.addListIcon,
                iconColor: ShopColors.green,
                backgroundColor: ShopColors.green.withAlpha((.3 * 255).toInt()))));
        breadCrumbs.add(Text(item!.listName!));
        if (item!.groupName != null) {
          breadCrumbs.add(Text(" |"));
        }
      }
      if (item!.groupName != null) {
        breadCrumbs.add(Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            child: CircularIcon(
                iconPath: Paths.addGroupIcon,
                iconColor: ShopColors.blue,
                backgroundColor: ShopColors.blue.withAlpha((.3 * 255).toInt()))));
        breadCrumbs.add(Text(item!.groupName!));
      }

      return Column(
        children: [
          Container(
              margin: EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: breadCrumbs,
              )),
          Container(
              margin: EdgeInsets.all(2),
              child: CategoryLabel(
                text: "Hamada",
                bgColor: Colors.greenAccent,
              )),
        ],
      );
    }
  }
}
