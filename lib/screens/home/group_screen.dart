
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/screens/home/lists_list.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/expandable_floating_button.dart';
import 'package:shopanizer/shared/widgets/photo_viewer.dart';
import 'package:shopanizer/shared/widgets/search_field.dart';

import 'new_list_screen.dart';

class GroupScreen extends StatefulWidget {
  GroupScreen(this.currentGroup);

  ShopGroup currentGroup;

  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {

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
                    TitleTV3(text: widget.currentGroup.name,),
                    LabelTV2(text: "${widget.currentGroup.lists.length} Lists | 2 Participants",),
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            SearchField(),
            SizedBox(height: 10,),
            Divider(thickness: 0.75, color: ShopColors.textFieldBorder,),

            Expanded(
              child: ListsList(widget.currentGroup.lists),
            )
          ],
        ),
      ),
      floatingActionButton: EaxpandableFAB(
        widget1: SvgPicture.asset(Paths.addListIcon),
        backgroundColor1: ShopColors.lightGreenButton,
        onPressed1: () => Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => NewListScreen(parentId: widget.currentGroup.id))
        ),
      ),
    );
  }
}
