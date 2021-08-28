import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/circular_icon.dart';

class SingleTile extends StatefulWidget {
  static const leadingIconToLabelPadding = 12.0;
  static const leadingIconHorizontalMargin = 12.0;
  static const rowPadding = 6.0;
  static const textRowsPadding = 4.0;
  static const textEditingBottomFieldPadding = 5.0; // used for better showing of error messages
  static const trailingIconHorizontalMargin = 12.0;
  static const singleTileHeight = 37.5;
  static const valuesBorderWidth = 0.5;
  static const unitsDropdownPadding = 4.0;

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
  final String? Function(String? input)? validatorFunc;
  final ValueNotifier<String?>? selectedUnit;
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
    this.validatorFunc,
    this.textInputType = TextInputType.text,
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
      constraints: BoxConstraints(minHeight: SingleTile.singleTileHeight),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: SingleTile.leadingIconHorizontalMargin),
      decoration: BoxDecoration(
        color: ShopColors.primary3Precent,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: SingleTile.rowPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: const EdgeInsets.symmetric(vertical: SingleTile.textRowsPadding), //must use the same padding as down there
                      child: Text(
                        widget.tileText!,
                        textAlign: TextAlign.left,
                        style: textStyle,
                      ),
                    )
                  : Container(
                      child: Container(
                        padding: EdgeInsets.only(bottom: SingleTile.textEditingBottomFieldPadding),
                        child: TextFormField(
                          controller: widget.tileTextEditingController,
                          keyboardType: widget.textInputType,
                          validator: widget.validatorFunc,
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.only(top: SingleTile.textRowsPadding), //same padding as up there
                              hintText: widget.tileTextEditingPlaceholder,
                              errorMaxLines: 3,
                              fillColor: Colors.transparent,
                              focusedBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              border: InputBorder.none),
                          style: textStyle,
                        ),
                      )),
            ),
            if (widget.units != null && widget.units!.length > 0)
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  children: [
                    Container(
                      width: SingleTile.valuesBorderWidth,
                      color: ShopColors.primary.withAlpha(60),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: SingleTile.unitsDropdownPadding),
                          child: DropdownButton(
                            isDense: true,
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
      ),
    );
  }
}
