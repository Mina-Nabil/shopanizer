import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:flutter_svg/svg.dart';
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
                ElevatedButton(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/check.svg', color: Colors.white,),
                      Text(" Done")
                    ],
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      primary: ShopColors.greenButton,
                      textStyle: TextStyle(fontWeight: FontWeight.w500)),
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
