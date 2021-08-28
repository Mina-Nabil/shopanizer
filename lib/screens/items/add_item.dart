import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopanizer/models/category.dart';
import 'package:shopanizer/services/ItemsDBService.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/dropdown_with_label.dart';
import 'package:shopanizer/shared/widgets/photo_picker.dart';
import 'package:shopanizer/shared/widgets/photo_viewer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopanizer/shared/widgets/property_tile.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';
import 'package:validators/validators.dart';

class AddNewItemScreen extends StatefulWidget {
  //form Limits
  final int nameMinLength = 4;
  final int nameMaxLength = 55;
  final int imagesLimit = 8;

  final int descMinLimit = 2;
  final int descMaxLimit = 255;

  final int brandMaxLimit = 55;

  static final screenName = "AddNewItem";

  const AddNewItemScreen({Key? key}) : super(key: key);

  @override
  _AddNewItemScreenState createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  //screen constants
  final int propertyIconBgAlpa = 15;
  final double photoGridPadding = 2.0;

  //form controllers
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _itemNameController = new TextEditingController();
  TextEditingController _listDescriptionController = new TextEditingController();

  List<TextEditingController> _priceEditingControllers = [new TextEditingController(text: "40")];
  Map<String, String> _priceUnits = {"EGP": "EGP", "USD": "USD"};
  List<ValueNotifier<String?>> _selectedPriceUnit = [new ValueNotifier("USD")];
  List<TextEditingController> _brandsEditingControllers = [];
  List<TextEditingController> _urlEditingControllers = [];
  List<TextEditingController> _locationEditingControllers = [];
  List<TextEditingController> _fbEditingControllers = [];
  List<TextEditingController> _instagramEditingControllers = [];
  List<XFile> _itemImages = [];

  int _selectedCategory = 1;

  submitForm() {
    _formKey.currentState?.validate();
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

//bokra eshta3'al fel form validations w submitting to the BE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ShopEdgeInsects.scaffoldPadding),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
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
                  validatorFunc: nameFieldValidator,
                ),
                FormSpacing(),

                FutureBuilder<List<Category>>(
                  future: ItemsDBService().categories,
                  builder: (ctxt, items) => DropDownWithLabel(
                    labelText: "Category",
                    placeHolder: "Furniture",
                    value: _selectedCategory,
                    items: (items.data == null) ? [] : items.data!.map(mapCategoryCollectionToDropDownItems).toList(),
                    onChangedCallback: (index) {
                      setState(() {
                        _selectedCategory = index;
                      });
                    },
                  ),
                ),
                FormSpacing(),
                Container(
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    children: buildImagesList(),
                  ),
                ),

                //list description
                FormSpacing(),
                TextBoxWithLabel(
                  labelText: "List Description",
                  placeHolder: "ay kalam kteerrrrr ",
                  controller: _listDescriptionController,
                  validatorFunc: descFieldValidator,
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
                  validatorFunc: priceFieldValidator,
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
                  validatorFunc: brandFieldValidator,
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
                  validatorFunc: urlFieldValidator,
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
                  validatorFunc: emptyFieldValidator,
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
                  validatorFunc: emptyFieldValidator,
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
                  validatorFunc: emptyFieldValidator,
                ),

                FormSpacing(),
              ],
            ),
          ),
        ),
      ),
    );
  }

//item builders

  DropdownMenuItem<int> mapCategoryCollectionToDropDownItems(Category c) {
    return DropdownMenuItem(
      child: Text(c.name),
      value: c.value,
    );
  }

  List<Widget> buildImagesList() {
    var imagesWidgetList = _itemImages.map((e) => Padding(
          padding: EdgeInsets.all(photoGridPadding),
          child: ImageViewer.square(image: Image.file(File(e.path),fit: BoxFit.cover,)),
        ));
    List<Widget> ret = [];

    if (_itemImages.length < widget.imagesLimit) {
      ret.add(Padding(
        padding: EdgeInsets.all(photoGridPadding),
        child: PhotoPicker.square(
          hasBorder: false,
            onPhotoPicked: (xfile) {
              setState(() {
                _itemImages.add(xfile);
              });
            }),
      ));
    }
    ret.addAll(imagesWidgetList);

    return ret;
  }

  //validators
  String? nameFieldValidator(input) {
    if (input == null || input.isEmpty) return "Item will be lost without a Name !";
    if (input.length < widget.nameMinLength)
      return "Very short Name :/ Please add " + (widget.nameMinLength - input.length).toString() + " characters";
    if (input.length > widget.nameMaxLength)
      return "Very long Name ! Please remove " + (input.length - widget.nameMaxLength).toString() + " characters";
  }

  String? descFieldValidator(input) {
    if (input == null || input.isEmpty) return null;
    if (input.length < widget.descMinLimit)
      return "Very short Description :/ Please add " + (widget.descMinLimit - input.length).toString() + " characters";
    if (input.length > widget.descMaxLimit)
      return "Very long Description ! Please remove " + (input.length - widget.descMaxLimit).toString() + " characters";
  }

  String? brandFieldValidator(input) {
    if (input == null || input.isEmpty) return "Please enter a brand name !";
    if (input.length > widget.brandMaxLimit)
      return "Very long Brand Name ! Please remove " + (input.length - widget.brandMaxLimit).toString() + " characters";
  }

  String? priceFieldValidator(input) {
    if (input == null || input.isEmpty) return "Please enter a price ";
    if (!isNumeric(input))
      return "Please enter a valid numeric value";
  }

  String? urlFieldValidator(input) {
    if (input == null || input.isEmpty) return "Please enter a Url ";
    if (!isURL(input))
      return "Please enter a valid Url";
  }

  String? emptyFieldValidator(input) {
    if (input == null || input.isEmpty) return "Please enter a Value ";
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
