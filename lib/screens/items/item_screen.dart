import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/services/ItemsDBService.dart';
import 'package:shopanizer/shared/paths.dart';
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
  static const double _titlePlaceholderWidth = 120; // the ratio is 1 / 2.5 of the screen
  static const double _descPlaceholderWidth = 300;
  static const double _breadCrumbsPlaceholderWidthRatio = 150;
  static const double _horizontalImagesListHeight = 135;
  static const double _imagesWidth = 120;
  static const double _belowImageslistPadding = 20;
  static const double _loversPlaceholderWidth = 20;

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
          ItemScreenSpacing(),
          buildDescription(),
          ItemScreenSpacing(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: _belowImageslistPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildLovers(),
              ],
            ),
          ),
          ItemScreenSpacing(),
        ],
      ),
    );
  }

  Widget buildTitleWidget() {
    if (item == null) {
      return Center(
        child: Container(
            width: _titlePlaceholderWidth,
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
            ShopImagePlaceholder(height: _horizontalImagesListHeight, width: _imagesWidth),
            ShopImagePlaceholder(height: _horizontalImagesListHeight, width: _imagesWidth),
            ShopImagePlaceholder(height: _horizontalImagesListHeight, width: _imagesWidth),
          ]));
    }
  }

  Widget buildDescription() {
    if (item == null) {
      return Center(
        child: Container(
            width: _descPlaceholderWidth,
            margin: EdgeInsets.all(_belowImageslistPadding),
            child: PlaceholderLines(
              count: 3,
              animate: true,
              lineHeight: 6,
              align: TextAlign.center,
              maxOpacity: 0.3,
              minOpacity: 0.1,
              color: ShopColors.labelDarkBlue,
            )),
      );
    } else {
      return Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: _belowImageslistPadding),
          child: ReadMoreTextTV(text: item!.desc ?? ""));
    }
  }

  Widget buildLovers() {
    if (item == null) {
      return Center(
        child: Container(
            width: _loversPlaceholderWidth,
            margin: EdgeInsets.all(_belowImageslistPadding),
            child: PlaceholderLines(
              count: 1,
              animate: true,
              lineHeight: 6,
              align: TextAlign.center,
              maxOpacity: 0.3,
              minOpacity: 0.1,
              color: ShopColors.labelDarkBlue,
            )),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: SvgPicture.asset(
                Paths.loveIcon,
                color: Colors.red,
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: LabelTV2(
                text: 2.toString(),
                color: ShopColors.labelDarkBlue,
              ))
        ],
      );
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
