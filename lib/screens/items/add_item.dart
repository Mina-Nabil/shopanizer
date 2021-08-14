import 'package:flutter/material.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/dropdown_with_label.dart';
import 'package:shopanizer/shared/widgets/property_tile.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';

class AddNewItemScreen extends StatefulWidget {
  static final screenName = "AddNewItem";

  const AddNewItemScreen({Key? key}) : super(key: key);

  @override
  _AddNewItemScreenState createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  //screen constant dimensions
  static const formFieldsPadding = 22.0;

  //form controllers
  TextEditingController _itemNameController = new TextEditingController();
  TextEditingController _listDescriptionController = new TextEditingController();
  List<DropdownMenuItem<int>> _categoryItems = [
    DropdownMenuItem(
      child: Text("HEEH"),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text("HOOH"),
      value: 2,
    ),
    DropdownMenuItem(
      child: Text("YEEH"),
      value: 3,
    ),
  ];
  List<TextEditingController> _brandsEditingControllers = [];

  int _selectedCategory = 1;

  submitForm() {
    print("Name: " + _itemNameController.text);
    print("Category: " + _selectedCategory.toString());
    print("Desc: " + _listDescriptionController.text);
    print("Brands: ");
    _brandsEditingControllers.forEach((element) {
      print(element.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          //title area
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: formFieldsPadding),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add new Item",
                  style: ShopFonts.titleStyle,
                ),
                DoneButton(onPressed: () {},),
              ],
            ),
          ),
          FormSpacing(),
          //item name
          TextBoxWithLabel(
            labelText: "Item Name",
            placeHolder: "Bedroom 1",
            controller: _itemNameController,
            margin: formFieldsPadding,
          ),
          FormSpacing(),

          DropDownWithLabel(
            labelText: "Category",
            placeHolder: "Furniture",
            value: _selectedCategory,
            items: _categoryItems,
            margin: formFieldsPadding,
            onChangedCallback: (index) {
              setState(() {
                _selectedCategory = index;
                print(_selectedCategory);
              });
            },
          ),

          //list description
          FormSpacing(),
          TextBoxWithLabel(
            labelText: "List Description",
            placeHolder: "ay kalam kteerrrrr ",
            controller: _listDescriptionController,
            maxLines: 5,
            margin: formFieldsPadding,
          ),

          FormSpacing(),
          PropertyTile(
            propertyName: "Brand",
            placeHolder: "Ikea",
            controllers: _brandsEditingControllers,
            margin: formFieldsPadding,
            limit: 3,
            mainIconPath: Paths.starIcon,
            mainIconColor: ShopColors.yellow,
            mainIconBackgroundColor: ShopColors.yellow.withAlpha(7),
            extraIconPath: Paths.emptyStarIcon,
            extraIconColor: ShopColors.primary,
            extraIconBackgroundColor: Colors.transparent,
          ),

          FormSpacing(),
        ],
      ),
    );
  }
}

class FormSpacing extends StatelessWidget {
  const FormSpacing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0,
    );
  }
}
