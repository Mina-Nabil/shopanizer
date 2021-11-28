import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';

class ShopanizerTile extends StatelessWidget {

  ShopanizerTile.group(ShopGroup group, {required this.onPressed}) {
    tileColor = ShopColors.groupTileBG;
    image = Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ba-0111778-lr-1592404733.jpg",fit: BoxFit.contain,);
    title = group.name;
    subtitle = "${group.lists.length} Lists | 3 participants";
    trailing = Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TileSubtitleTV(text: "28/8/2021")
        ],
      );
    bookmark = SvgPicture.asset(Paths.groupBookmark,);
  }

  ShopanizerTile.list(ShopList list, {required this.onPressed}) {
    tileColor = ShopColors.listTileBG;
    image = Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ba-0111778-lr-1592404733.jpg",fit: BoxFit.contain,);
    title = list.name;
    subtitle = "15 Item";
    trailing = Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TileSubtitleTV(text: "28/8/2021")
        ],
      );
    bookmark = SvgPicture.asset(Paths.listBookmark,);
  }

  ShopanizerTile.item(ShopItem item, {required this.onPressed}) {
    tileColor = ShopColors.itemTileBG;
    image = Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ba-0111778-lr-1592404733.jpg",fit: BoxFit.contain,);
    title = item.name;
    subtitle = "price";
    trailing = Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TileSubtitleTV(text: "28/8/2021")
        ],
      );
    bookmark = SvgPicture.asset(Paths.itemBookmark,);
  }

  late final Image image;
  late final String title;
  late final String subtitle;
  late final Widget trailing;
  late final Color tileColor;
  late final Widget bookmark;
  final VoidCallback onPressed;
  final double contentPadding = 10;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: contentPadding),
            child: bookmark,
          )),
         ListTile(
           contentPadding: EdgeInsets.symmetric(horizontal: contentPadding),
        tileColor: tileColor,
        leading: CircleAvatar(backgroundImage: image.image,),
        title: TileTitleTV(text:title,),
        subtitle: TileSubtitleTV(text: subtitle),
        trailing: trailing,
        onTap: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )

      ),
    ]
    );
  }
}
