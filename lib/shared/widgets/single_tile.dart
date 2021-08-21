import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/circular_icon.dart';

class SingleTile extends StatefulWidget {
  static const leadingIconToLabelPadding = 12.0;
  static const leadingIconHorizontalMargin = 12.0;
  static const textEditingFieldPadding = 12.0;
  static const trailingIconHorizontalMargin = 12.0;
  static const singleTileHeight = 37.5;

  final String? tileText;
  final TextEditingController? tileTextEditingController;
  final String? tileTextEditingPlaceholder;
  final String? leadingIconPath;
  final Color? leadingIconColor;
  final Color? leadingIconBackgroundColor;
  final String? trailingIconPath;
  final Color? trailingIconColor;
  final Color? trailingIconBackgroundColor;
  final Function(int)? trailingIconOnPressCallback;
  final double? trailingIconRadius;
  final double? trailingIconPadding;
  final TextInputType textInputType;
  final Map<dynamic, String>? units;
  ValueNotifier<String?>? selectedUnit;
  final int tileIndex;

  SingleTile({
    required this.tileIndex,
    this.tileText,
    this.tileTextEditingController,
    this.tileTextEditingPlaceholder,
    this.leadingIconPath,
    this.leadingIconColor,
    this.leadingIconBackgroundColor,
    this.trailingIconPath,
    this.trailingIconColor,
    this.trailingIconBackgroundColor,
    this.trailingIconOnPressCallback,
    this.trailingIconRadius,
    this.trailingIconPadding,
    this.units,
    this.selectedUnit,
    this.textInputType=TextInputType.text,
  }) {
    assert(tileText != null || tileTextEditingController != null,
        "Make sure to supply either tileText or tileTextEditingController");
    assert(leadingIconPath == null || (leadingIconBackgroundColor != null && leadingIconColor != null),
        "Make sure leadingIconBackgroundColor & leadingIconColor are supplied with the leadingIconPath");
    assert(
        trailingIconPath == null ||
            (trailingIconBackgroundColor != null && trailingIconOnPressCallback != null && trailingIconColor != null),
        "Make sure trailingIconBackgroundColor & trailingIconOnPressCallback & trailingIconColor are supplied with the trailingIconPath");
    assert(units == null || (selectedUnit != null), "Make sure selectedUnit is supplied with the units list");
  }

  @override
  _SingleTileState createState() => _SingleTileState();
}

class _SingleTileState extends State<SingleTile> {
  final double valuesBorderWidth = 0.5;

  final double unitsDropdownPadding = 5.0;

  final textStyle = TextStyle(
    color: ShopColors.labelDarkBlue,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
  );

  List<DropdownMenuItem>? getMenuItemsFromMap(Map<dynamic, String> units) {
    List<DropdownMenuItem> retList = [];
    units.forEach((key, value) {
      retList.add(DropdownMenuItem(
        child: Text(value),
        value: value,
      ));
    });
    return retList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SingleTile.singleTileHeight,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: SingleTile.leadingIconHorizontalMargin),
      decoration: BoxDecoration(color: ShopColors.primary3Precent),
      child: Row(
        children: [
          if (widget.leadingIconPath != null)
            Container(
                margin: EdgeInsets.only(right: SingleTile.leadingIconToLabelPadding),
                child: CircularIcon(
                    iconColor: widget.leadingIconColor!,
                    backgroundColor: widget.leadingIconBackgroundColor!,
                    iconPath: widget.leadingIconPath!)),
          Flexible(
            fit: FlexFit.tight,
            child: widget.tileText != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      widget.tileText!,
                      textAlign: TextAlign.left,
                      style: textStyle,
                    ),
                  )
                : Container(
                    child: TextFormField(
                    controller: widget.tileTextEditingController,
                    keyboardType: widget.textInputType,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: SingleTile.textEditingFieldPadding),
                        hintText: widget.tileTextEditingPlaceholder,
                        fillColor: Colors.transparent,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none),
                    style: textStyle,
                  )),
          ),
          if (widget.units != null && widget.units!.length > 0)
            Flexible(
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Container(
                    width: valuesBorderWidth,
                    color: ShopColors.primary.withAlpha(60),
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: unitsDropdownPadding),
                        child: DropdownButton(
                          isExpanded: true,
                          underline: Container(),
                          iconEnabledColor: ShopColors.primary,
                          items: getMenuItemsFromMap(widget.units!),
                          value: widget.selectedUnit!.value,
                          style: textStyle,
                          onChanged: (dynamic newValue) {
                            setState(() {
                              widget.selectedUnit!.value = newValue;
                            });
                          },
                        )),
                  )
                ],
              ),
            ),
          if (widget.trailingIconPath != null)
            GestureDetector(
              onTap: () => widget.trailingIconOnPressCallback!(widget.tileIndex),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: SingleTile.trailingIconHorizontalMargin),
                alignment: Alignment.center,
                child: CircularIcon(
                  iconPath: widget.trailingIconPath!,
                  iconColor: widget.trailingIconColor!,
                  backgroundColor: widget.trailingIconBackgroundColor!,
                  radius: widget.trailingIconRadius ?? CircularIcon.defaultRadius,
                  padding: widget.trailingIconPadding ?? CircularIcon.defaultPadding,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
