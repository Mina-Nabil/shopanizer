import 'package:flutter/material.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/rounded_corner_button.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';

class NewGroupScreen extends StatefulWidget {
  @override
  _NewGroupScreenState createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add new group",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                RoundedCornerButton(
                  text: " Done",
                  backgroundColor: ShopColors.greenButton,
                  iconPath: Paths.checkIcon,
                  onPressCallback: () {},
                )
              ],
            ),
            TextBoxWithLabel(
              labelText: "Group Name",
              placeHolder: "Group Name",
            )
          ],
        ),
      ),
    );
  }
}
