import 'package:flutter/material.dart';
import 'package:shopanizer/screens/home/new_group_screen.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';

class AddNewItemScreen extends StatefulWidget {
  static final screenName = "AddNewItem";

  const AddNewItemScreen({Key? key}) : super(key: key);

  @override
  _AddNewItemScreenState createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: Text(
                    "Add new Item",
                    style: ShopFonts.titleStyle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
