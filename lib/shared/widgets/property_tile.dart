import 'package:flutter/material.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/single_tile.dart';

class PropertyTile extends StatefulWidget {
  //widget constants
  static const borderRadius = 5.0;
  final double valuesBorderPadding = 10.0;
  final double valuesBorderWidth = 0.5;
  final String errorMessage = "Limit Reached";

  //vars
  final String propertyName;
  final String placeHolder;
  final int limit;
  final String? mainIconPath;
  final Color? mainIconColor;
  final Color? mainIconBackgroundColor;
  final String? extraIconPath;
  final Color? extraIconColor;
  final Color? extraIconBackgroundColor;
  final List<TextEditingController> controllers;
  final Map<dynamic, String>? units;
  final List<ValueNotifier<String?>>? selectedUnits;
  final TextInputType textInputType;
  final String? Function(String? input)? validatorFunc;

  PropertyTile(
      {required this.propertyName,
      required this.placeHolder,
      required this.controllers,
      this.limit = 1,
      this.mainIconPath,
      this.mainIconColor,
      this.mainIconBackgroundColor,
      this.extraIconPath,
      this.extraIconColor,
      this.extraIconBackgroundColor,
      this.units,
      this.validatorFunc,
      this.textInputType=TextInputType.text,
      this.selectedUnits}) {
    assert(mainIconPath == null || (mainIconBackgroundColor != null && mainIconColor != null), "Please supply mainIconBackgroundColor & mainIconColor with the mainIconPath");
    assert(extraIconPath == null || (extraIconBackgroundColor != null && extraIconColor != null), "Please supply extraIconBackgroundColor & extraIconColor with extraIconPath");
    assert(controllers.length <= limit, "Controller length is higher than the limit");
    assert(units == null ||
        (units!.length > 0 &&
            selectedUnits != null &&
            (selectedUnits!.length == controllers.length)), "Units check failed, please check selected units list and type. Make sure selectedUnits's length is equal to controller's length");
  }

  @override
  _PropertyTileState createState() => _PropertyTileState();
}

class _PropertyTileState extends State<PropertyTile> {
  bool isAddDisabled = false;
  bool isUnit = false;

  addValueButton(index) {
    setState(() {
      if (widget.limit > widget.controllers.length) {
        widget.controllers.add(new TextEditingController());
        if (isUnit) widget.selectedUnits!.add(new ValueNotifier<String?>(widget.units?.values.first));
      } else {
        isAddDisabled = true;
        showSnackbar(widget.errorMessage);
      }
    });
  }

  removeController(int index) {
    setState(() {
      widget.controllers.removeAt(index);
      if (isUnit) widget.selectedUnits?.removeAt(index);
      isAddDisabled = (widget.limit <= widget.controllers.length);
    });
  }

  showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ));
  }

  List<Widget> buildSingleTiles() {
    List<Widget> retList = [];
    int i = 0;

    widget.controllers.forEach((controller) {
      retList.add(Column(
        children: [
          Container(
            height: widget.valuesBorderWidth,
            margin: EdgeInsets.symmetric(horizontal: widget.valuesBorderPadding),
            color: ShopColors.primary.withAlpha(60),
          ),
          SingleTile(
              tileIndex: i,
              tileTextEditingController: controller,
              tileTextEditingPlaceholder: widget.placeHolder,
              leadingIconPath: widget.extraIconPath,
              leadingIconColor: widget.extraIconColor,
              leadingIconBackgroundColor: widget.extraIconBackgroundColor,
              trailingIconPath: Paths.xIcon,
              trailingIconColor: Colors.transparent,
              trailingIconBackgroundColor: Colors.transparent,
              trailingIconPadding: 4,
              trailingIconOnPressCallback: (index) => removeController(index),
              units: widget.units,
              validatorFunc: widget.validatorFunc,
              selectedUnit: widget.selectedUnits?[i],
              textInputType: widget.textInputType,),
        ],
      ));
      i++;
    });

    return retList;
  }

  @override
  void initState() {
    isAddDisabled = (widget.limit <= widget.controllers.length);
    isUnit = widget.units != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleTile(
                tileIndex: 0,
                tileText: widget.propertyName,
                leadingIconPath: widget.mainIconPath,
                leadingIconBackgroundColor: widget.mainIconBackgroundColor,
                trailingIconPath: Paths.crossIcon,
                leadingIconColor: widget.mainIconColor,
                trailingIconColor: ShopColors.primary,
                trailingIconBackgroundColor: ShopColors.primary.withAlpha(25),
                trailingIconOnPressCallback: isAddDisabled ? (index) {} : addValueButton,
              )
            ]..addAll(buildSingleTiles())));
  }
}
