import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/circular_icon.dart';

class SingleTile extends StatelessWidget {
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
  final Function? trailingIconOnPressCallback;
  final double? trailingIconRadius;
  final double? trailingIconPadding;

  SingleTile({
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
  }) {
    assert(tileText != null || tileTextEditingController != null);
    assert(leadingIconPath == null || (leadingIconBackgroundColor != null && leadingIconColor != null));
    assert(trailingIconPath == null || (trailingIconBackgroundColor != null && trailingIconOnPressCallback != null && trailingIconColor !=null));
  }

  final textStyle = TextStyle(
    color: ShopColors.textColor,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: singleTileHeight,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: leadingIconHorizontalMargin),
      decoration: BoxDecoration(color: ShopColors.propertyTilePurpleBgColor),
      child: Row(
        children: [
          if (leadingIconPath != null)
            Container(
                margin: EdgeInsets.only(right: leadingIconToLabelPadding),
                child: CircularIcon(
                  iconColor: leadingIconColor!,
                   backgroundColor: leadingIconBackgroundColor!, iconPath: leadingIconPath!)),
          Expanded(
            child: tileText != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      tileText!,
                      textAlign: TextAlign.left,
                      style: textStyle,
                    ),
                  )
                : Container(
                    child: TextFormField(
                    controller: tileTextEditingController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: textEditingFieldPadding),
                        hintText: tileTextEditingPlaceholder,
                        fillColor: Colors.transparent,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none),
                    style: textStyle,
                  )),
          ),
          if (trailingIconPath != null)
            GestureDetector(
              onTap: () => trailingIconOnPressCallback!(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: trailingIconHorizontalMargin),
                alignment: Alignment.center,
                child: CircularIcon(
                  iconPath: trailingIconPath!,
                  iconColor: trailingIconColor!,
                  backgroundColor: trailingIconBackgroundColor!,
                  radius: trailingIconRadius ?? CircularIcon.defaultRadius,
                  padding: trailingIconPadding ?? CircularIcon.defaultPadding,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
