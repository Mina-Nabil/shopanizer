import 'package:flutter/material.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';

class NewGroupScreen extends StatefulWidget {
  @override
  _NewGroupScreenState createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  TextEditingController _groupLabelController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add new group",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                DoneButton(onPressed: () {},)
              ],
            ),
            TextBoxWithLabel(
              controller: _groupLabelController,
              labelText: "Group Name",
              placeHolder: "Group Name",
            ),
          ],
        ),
      ),
    );
  }
}
