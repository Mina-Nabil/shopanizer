import 'package:flutter/material.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/single_tile.dart';

class PropertyTile extends StatefulWidget {
  //widget constants
  static const borderRadius = 5.0;

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
      this.extraIconBackgroundColor}) {
    assert(mainIconPath == null || (mainIconBackgroundColor != null && mainIconColor != null));
    assert(extraIconPath == null || (extraIconBackgroundColor != null && extraIconColor != null));
    assert(controllers.length <= limit);
  }

  @override
  _PropertyTileState createState() => _PropertyTileState();
}

class _PropertyTileState extends State<PropertyTile> {
  bool isAddDisabled = false;

  addValueButton() {
    setState(() {
      if (widget.limit > widget.controllers.length)
        widget.controllers.add(new TextEditingController());
      else {
        isAddDisabled = true;
        showSnackbar('Can\'t Add more!');
      }
    });
  }

  removeController(contreller) {
    setState(() {
      widget.controllers.remove(contreller);
      isAddDisabled = (widget.limit <= widget.controllers.length);
    });
  }

  showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  void initState() {
    isAddDisabled = (widget.limit <= widget.controllers.length);
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
                tileText: widget.propertyName,
                leadingIconPath: widget.mainIconPath,
                leadingIconBackgroundColor: widget.mainIconBackgroundColor,
                trailingIconPath: Paths.crossIcon,
                leadingIconColor: widget.mainIconColor,
                trailingIconColor: ShopColors.primary,
                trailingIconBackgroundColor: ShopColors.primary.withAlpha(25),
                trailingIconOnPressCallback: isAddDisabled ? () {} : addValueButton,
              )
            ]..addAll(widget.controllers.map((controller) => SingleTile(
                  tileTextEditingController: controller,
                  tileTextEditingPlaceholder: widget.placeHolder,
                  leadingIconPath: widget.extraIconPath,
                  leadingIconColor: widget.extraIconColor,
                  leadingIconBackgroundColor: widget.extraIconBackgroundColor,
                  trailingIconPath: Paths.xIcon,
                  trailingIconColor: Colors.transparent,
                  trailingIconBackgroundColor: Colors.transparent,
                  trailingIconPadding: 4,
                  trailingIconOnPressCallback: () => removeController(controller),
                )))));
  }
}
