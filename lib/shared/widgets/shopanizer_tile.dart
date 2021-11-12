import 'package:flutter/material.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';

class ShopanizerTile extends StatelessWidget {

  ShopanizerTile.group(ShopGroup group, {required this.onPressed}) {
    tileColor = ShopColors.groupTileBG;
    image = Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ba-0111778-lr-1592404733.jpg",fit: BoxFit.contain,);
    title = group.name;
    subtitle = "0 Lists | 3 participants";
    trailing = Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TileSubtitleTV(text: "28/8/2021")
        ],
      );
  }

  ShopanizerTile.list(ShopList list, {required this.onPressed}) {
    tileColor = ShopColors.itemTileBG;
    image = Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ba-0111778-lr-1592404733.jpg",fit: BoxFit.contain,);
    title = list.name;
    subtitle = "price";
    trailing = Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TileSubtitleTV(text: "28/8/2021")
        ],
      );
  }

  ShopanizerTile.item({required this.onPressed}) {
    tileColor = ShopColors.listTileBG;
    image = Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ba-0111778-lr-1592404733.jpg",fit: BoxFit.contain,);
    title = "Item Name";
    subtitle = "15 Items";
    trailing = Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TileSubtitleTV(text: "28/8/2021")
        ],
      );
  }

  late final Image image;
  late final String title;
  late final String subtitle;
  late final Widget trailing;
  late final Color tileColor;
  final VoidCallback onPressed;

  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor,
      leading: CircleAvatar(backgroundImage: image.image,),
      title: TileTitleTV(text:title,),
      subtitle: TileSubtitleTV(text: subtitle),
      trailing: trailing,
      onTap: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      )

    );
  }
}
