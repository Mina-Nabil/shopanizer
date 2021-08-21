import 'package:flutter/material.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/dropdown_with_label.dart';
import 'package:shopanizer/shared/widgets/property_tile.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';

class AddNewItemScreen extends StatefulWidget {
  static final screenName = "AddNewItem";

  const AddNewItemScreen({Key? key}) : super(key: key);

  @override
  _AddNewItemScreenState createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  //screen constants
  final int propertyIconBgAlpa = 15;

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
  List<TextEditingController> _priceEditingControllers = [new TextEditingController(text: "40")];
  Map<String, String> _priceUnits = {"EGP": "EGP", "USD": "USD"};
  List<ValueNotifier<String?>> _selectedPriceUnit = [new ValueNotifier("USD")];
  List<TextEditingController> _brandsEditingControllers = [];
  List<TextEditingController> _urlEditingControllers = [];
  List<TextEditingController> _locationEditingControllers = [];
  List<TextEditingController> _fbEditingControllers = [];
  List<TextEditingController> _instagramEditingControllers = [];

  int _selectedCategory = 1;

  submitForm() {
    print("Name: " + _itemNameController.text);
    print("Category: " + _selectedCategory.toString());
    print("Desc: " + _listDescriptionController.text);
    print("PriceUnits: ");
    _selectedPriceUnit.forEach((element) {
      print(element.value);
    });
    print("Brands: ");
    _brandsEditingControllers.forEach((element) {
      print(element.text);
    });
    print("Urls: ");
    _urlEditingControllers.forEach((element) {
      print(element.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: ShopEdgeInsects.scaffoldPadding),
            shrinkWrap: true,
            children: [
              //title area
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleTV2(
                    titleText: "Add new Item",
                  ),
                  DoneButton(
                    onPressed: submitForm,
                  ),
                ],
              ),
              FormSpacing(),
              //item name
              TextBoxWithLabel(
                labelText: "Item Name",
                placeHolder: "Bedroom 1",
                controller: _itemNameController,
              ),
              FormSpacing(),

              DropDownWithLabel(
                labelText: "Category",
                placeHolder: "Furniture",
                value: _selectedCategory,
                items: _categoryItems,
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
              ),

              FormSpacing(),
              PropertyTile(
                propertyName: "Price",
                placeHolder: "40.00",
                controllers: _priceEditingControllers,
                limit: 3,
                mainIconPath: Paths.priceIcon,
                mainIconColor: ShopColors.yellow,
                mainIconBackgroundColor: ShopColors.primary.withAlpha(propertyIconBgAlpa),
                extraIconPath: Paths.emptyPriceIcon,
                extraIconColor: ShopColors.primary,
                extraIconBackgroundColor: Colors.transparent,
                units: _priceUnits,
                selectedUnits: _selectedPriceUnit,
                textInputType: TextInputType.numberWithOptions(decimal: true),
              ),

              FormSpacing(),
              PropertyTile(
                propertyName: "Brand",
                placeHolder: "Ikea",
                controllers: _brandsEditingControllers,
                limit: 3,
                mainIconPath: Paths.starIcon,
                mainIconColor: ShopColors.yellow,
                mainIconBackgroundColor: ShopColors.yellow.withAlpha(propertyIconBgAlpa),
                extraIconPath: Paths.emptyStarIcon,
                extraIconColor: ShopColors.primary,
                extraIconBackgroundColor: Colors.transparent,
              ),

              FormSpacing(),
              PropertyTile(
                propertyName: "URL",
                placeHolder: "www.ikea.com/bedrooms/1",
                controllers: _urlEditingControllers,
                limit: 3,
                mainIconPath: Paths.urlIcon,
                mainIconColor: ShopColors.yellow,
                mainIconBackgroundColor: ShopColors.red.withAlpha(propertyIconBgAlpa),
                extraIconPath: Paths.emptyUrlIcon,
                extraIconColor: ShopColors.primary,
                extraIconBackgroundColor: Colors.transparent,
              ),

              FormSpacing(),
              PropertyTile(
                propertyName: "Location",
                placeHolder: "https://goo.gl/maps/12mklj13k",
                controllers: _locationEditingControllers,
                limit: 3,
                mainIconPath: Paths.locationIcon,
                mainIconColor: ShopColors.yellow,
                mainIconBackgroundColor: ShopColors.green.withAlpha(propertyIconBgAlpa),
                extraIconPath: Paths.emptyLocationIcon,
                extraIconColor: ShopColors.primary,
                extraIconBackgroundColor: Colors.transparent,
              ),
              FormSpacing(),
              PropertyTile(
                propertyName: "Facebook",
                placeHolder: "https://fb.com/my_profile_id",
                controllers: _fbEditingControllers,
                limit: 3,
                mainIconPath: Paths.fbIcon,
                mainIconColor: ShopColors.yellow,
                mainIconBackgroundColor: ShopColors.blue.withAlpha(propertyIconBgAlpa),
                extraIconPath: Paths.emptyFbIcon,
                extraIconColor: ShopColors.primary,
                extraIconBackgroundColor: Colors.transparent,
              ),
              FormSpacing(),
              PropertyTile(
                propertyName: "Instagram",
                placeHolder: "https://instagram.com/my_profile_id",
                controllers: _instagramEditingControllers,
                limit: 3,
                mainIconPath: Paths.instagramIcon,
                mainIconColor: ShopColors.yellow,
                mainIconBackgroundColor: ShopColors.primary.withAlpha(propertyIconBgAlpa),
                extraIconPath: Paths.emptyInstagramIcon,
                extraIconColor: ShopColors.primary,
                extraIconBackgroundColor: Colors.transparent,
              ),

              FormSpacing(),
            ],
          ),
        ));
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
