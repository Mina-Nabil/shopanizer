import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopanizer/models/item.dart';
import 'package:shopanizer/services/DatabaseService.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/categories_list.dart';
import 'package:shopanizer/shared/widgets/photo_picker.dart';
import 'package:shopanizer/shared/widgets/photo_viewer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopanizer/shared/widgets/property_tile.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';
import 'package:validators/validators.dart';

class AddNewItemScreen extends StatefulWidget {
  static final screenName = "AddNewItem";

  final ShopItem? item;
  final String parentId;
  const AddNewItemScreen({this.parentId ="", this.item});

  @override
  _AddNewItemScreenState createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  //screen constants
  final int propertyIconBgAlpa = 15;
  final double photoGridPadding = 2.0;

  //form Limits
  final int nameMinLength = 4;
  final int nameMaxLength = 55;
  final int imagesLimit = 8;

  final int descMinLimit = 2;
  final int descMaxLimit = 255;

  final int brandMaxLimit = 55; //55 characters max for each brand

  final int brandsValuesLimit = 1; //only one brand per item
  final int pricesValuesLimit = 1; //only one price per item
  final int urlValuesLimit = 3;
  final int locationValuesLimit = 3;
  final int fbValuesLimit = 3;
  final int instaValuesLimit = 3;

  //form controllers
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _itemNameController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  List<TextEditingController> _priceEditingControllers = [new TextEditingController(text: "40")];
  Map<String, String> _priceUnits = {"EGP": "EGP", "USD": "USD"};
  List<ValueNotifier<String?>> _selectedPriceUnit = [new ValueNotifier("USD")];
  List<TextEditingController> _brandsEditingControllers = [];
  List<TextEditingController> _urlEditingControllers = [];
  List<TextEditingController> _locationEditingControllers = [];
  List<TextEditingController> _fbEditingControllers = [];
  List<TextEditingController> _instagramEditingControllers = [];
  List<XFile> _itemImages = [];

  ValueNotifier<int> _selectedCategory = new ValueNotifier(1);

  @override
  void initState() {
    if (widget.item != null) {
      _itemNameController.text =  widget.item!.name ;
      _selectedCategory.value = int.parse(widget.item!.catgID);
      _descriptionController.text = widget.item!.desc ?? "";
      _priceEditingControllers = mapDoublesToTextEditors(widget.item!.price);
      _brandsEditingControllers = mapStringsToTextEditors(widget.item!.brand);
      _urlEditingControllers = mapStringsToTextEditors(widget.item!.urls);
      _locationEditingControllers = mapStringsToTextEditors(widget.item!.locations);
      _fbEditingControllers = mapStringsToTextEditors(widget.item!.fbs);
      _instagramEditingControllers = mapStringsToTextEditors(widget.item!.instas);
    }
    super.initState();
  }

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
                      text: "Add new Item",
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

                CategoriesDropDownList(_selectedCategory),
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
                  controller: _descriptionController,
                  validatorFunc: descFieldValidator,
                  maxLines: 5,
                ),

                FormSpacing(),
                PropertyTile(
                  propertyName: "Price",
                  placeHolder: "40.00",
                  controllers: _priceEditingControllers,
                  limit: pricesValuesLimit,
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
                  limit: brandsValuesLimit,
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
                  limit: urlValuesLimit,
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
                  limit: locationValuesLimit,
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
                  limit: fbValuesLimit,
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
                  limit: instaValuesLimit,
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

  submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      ShopItem newItem = new ShopItem(
        name: _itemNameController.text,
        categoryID: _selectedCategory.value.toString(),
        desc: _descriptionController.text,
        brand: mapEditingControllersToStrings(_brandsEditingControllers),
        price: mapEditingControllersToDoubles(_priceEditingControllers),
        urls: mapEditingControllersToStrings(_urlEditingControllers),
        locations: mapEditingControllersToStrings(_locationEditingControllers),
        fbs: mapEditingControllersToStrings(_fbEditingControllers),
        instas: mapEditingControllersToStrings(_instagramEditingControllers),
      );
      await DatabaseHelper.createNewItemInList(widget.parentId,newItem);
      Navigator.pop(context);
    }
  }

  //validators
  String? nameFieldValidator(input) {
    if (input == null || input.isEmpty) return "Item will be lost without a Name !";
    if (input.length < nameMinLength)
      return "Very short Name :/ Please add " + (nameMinLength - input.length).toString() + " characters";
    if (input.length > nameMaxLength)
      return "Very long Name ! Please remove " + (input.length - nameMaxLength).toString() + " characters";
  }

  String? descFieldValidator(input) {
    if (input == null || input.isEmpty) return null;
    if (input.length < descMinLimit)
      return "Very short Description :/ Please add " + (descMinLimit - input.length).toString() + " characters";
    if (input.length > descMaxLimit)
      return "Very long Description ! Please remove " + (input.length - descMaxLimit).toString() + " characters";
  }

  String? brandFieldValidator(input) {
    if (input == null || input.isEmpty) return "Please enter a brand name !";
    if (input.length > brandMaxLimit)
      return "Very long Brand Name ! Please remove " + (input.length - brandMaxLimit).toString() + " characters";
  }

  String? priceFieldValidator(input) {
    if (input == null || input.isEmpty) return "Please enter a price ";
    if (!isNumeric(input)) return "Please enter a valid numeric value";
  }

  String? urlFieldValidator(input) {
    if (input == null || input.isEmpty) return "Please enter a Url ";
    if (!isURL(input)) return "Please enter a valid Url";
  }

  String? emptyFieldValidator(input) {
    if (input == null || input.isEmpty) return "Please enter a Value ";
  }

  //mappers
  List<Widget> buildImagesList() {
    var imagesWidgetList = _itemImages.map((e) => Padding(
          padding: EdgeInsets.all(photoGridPadding),
          child: PhotoViewer.square(
              image: Image.file(
            File(e.path),
            fit: BoxFit.cover,
          )),
        ));
    List<Widget> ret = [];

    if (_itemImages.length < imagesLimit) {
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

  List<TextEditingController> mapDoublesToTextEditors(List<double>? values) {
    if (values != null)
      return values.map((e) => TextEditingController(text: e.toString())).toList();
    else
      return [];
  }

  List<TextEditingController> mapStringsToTextEditors(List<String>? values) {
    if (values != null)
      return values.map((e) => TextEditingController(text: e)).toList();
    else
      return [];
  }

  List<String> mapEditingControllersToStrings(List<TextEditingController> textEditors) {
    return textEditors.map((e) => e.text).toList();
  }

  List<double> mapEditingControllersToDoubles(List<TextEditingController> textEditors) {
    return textEditors.map((e) => double.parse(e.text)).toList();
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
