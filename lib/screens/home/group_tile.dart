import 'package:flutter/material.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';

class GroupTile extends StatelessWidget {
  final Group group;

  const GroupTile(this.group);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: ShopColors.groupTileBG,
      leading: CircleAvatar(
        backgroundImage: Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ba-0111778-lr-1592404733.jpg",fit: BoxFit.contain,).image,
      ),
      title: TileTitleTV(text: group.name,),
      subtitle: TileSubtitleTV(text: "0 Lists | 3 participants"),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TileSubtitleTV(text: "28/8/2021")
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
