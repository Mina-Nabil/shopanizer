import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/screens/home/new_list_screen.dart';
import 'package:shopanizer/screens/items/add_item.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/expandable_floating_button.dart';
import 'package:shopanizer/shared/widgets/item_tile.dart';
import 'package:shopanizer/shared/widgets/photo_viewer.dart';
class ListScreen extends StatelessWidget {

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
                    TitleTV3(text: "Bedrooms",),
                    LabelTV2(text: "list name | group name",),
                    LabelTV2(text: "category",),
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Divider(thickness: 0.75, color: ShopColors.textFieldBorder,),

            Expanded(child: itemsList())
          ],
        ),
      ),
      floatingActionButton: EaxpandableFAB(
        widget1: SvgPicture.asset(Paths.addListIcon),
        backgroundColor1: ShopColors.lightGreenButton,
        onPressed1: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NewListScreen())),
        widget2: SvgPicture.asset(Paths.addItemIcon),
        backgroundColor2: ShopColors.greenButton,
        onPressed2: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddNewItemScreen())),
      ),
    );
  }

  Widget itemsList() {
    List<ShoppingItem> _lists = [
      ShoppingItem(name: "Bedroom 1", categoryID: "1"),
      ShoppingItem(name: "Bedroom 2", categoryID: "1"),
    ];
    return ListView(
      children: _lists.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ItemTile(),
            )).toList(),
    );
  }
}