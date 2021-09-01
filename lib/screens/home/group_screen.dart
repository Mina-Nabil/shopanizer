import 'package:flutter/material.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/photo_viewer.dart';
import 'package:shopanizer/shared/widgets/shop_list_tile.dart';

class GroupScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: ShopEdgeInsects.scaffoldPadding),
        child: Column(
          children: [
            Row(
              children: [
                PhotoViewer.circular(
                  image: Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ba-0111778-lr-1592404733.jpg",fit: BoxFit.cover,),
                  radius: 30.0,
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTV3(text: "My Home",),
                    LabelTV2(text: "0 Lists | 2 Participants",),
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Divider(thickness: 0.75, color: ShopColors.textFieldBorder,),

            Expanded(child: listsList())
          ],
        ),
      ),
    );
  }

  Widget listsList() {
    List<ListModel> _lists = [
      ListModel(id: "1", name: "Grocery", desc: ""),
      ListModel(id: "1", name: "Grocery", desc: ""),
    ];
    return ListView(
      children: _lists.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ShopListTile(),
            )).toList(),
    );
  }
}