import 'package:flutter/material.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/services/ItemsDBService.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/bread_crumbs.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:shopanizer/shared/widgets/category_label.dart';
import 'package:shopanizer/shared/widgets/horizontal_images_list.dart';
import 'package:shopanizer/shared/widgets/shop_image_placeholder.dart';

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
  static const double _horizontalImagesListHeight = 135;

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
          ItemScreenSpacing(),
          buildHorizontalImagesList(),
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
    if (item == null) {
      var breadCrumbPlacholder = Center(
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
      return breadCrumbPlacholder;
    } else {
      return Column(
        children: [
          ShopanizerBreadCrumbs.fromItem(item!),
          Container(
              margin: EdgeInsets.all(2),
              child: CategoryLabel(
                text: "Hamada",
                bgColor: ShopColors.listTileBG,
              )),
        ],
      );
    }
  }

  Widget buildHorizontalImagesList() {
    if (item != null) {
      return ShopHorizontalImagesList(height: _horizontalImagesListHeight, item: item);
    } else {
      return Container(
          height: _horizontalImagesListHeight,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            ShopImagePlaceholder(height: _horizontalImagesListHeight, width: MediaQuery.of(context).size.width / 3),
            ShopImagePlaceholder(height: _horizontalImagesListHeight, width: MediaQuery.of(context).size.width / 3),
            ShopImagePlaceholder(height: _horizontalImagesListHeight, width: MediaQuery.of(context).size.width / 3),
          ]));
    }
  }
}


class ItemScreenSpacing extends StatelessWidget {
  Widget build(context) {
    return Container(
      height: 20,
    );
  }
}
