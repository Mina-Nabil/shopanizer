import 'package:flutter/material.dart';

import 'package:shopanizer/shared/Themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';

class TextBoxWithLabel extends StatelessWidget {
  //default dimensions
  static const borderRadius = 20.0;
  final contentPadding = 10.0;
  final labelFontSize = 14.0;
  final labelSpacing = 10.0;

  final String _labelText;
  final String _placeHolder;
  final TextEditingController _controller;
  final int maxLines;

  final double margin;

  TextBoxWithLabel(
      {required String labelText,
      required String placeHolder,
      required TextEditingController controller,
      this.margin = 10,
      this.maxLines = 1})
      : this._labelText = labelText,
        this._controller = controller,
        this._placeHolder = placeHolder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            child: LabelTV(
              labelText: _labelText,
            ),
          ),
          Container(
            height: labelSpacing,
            width: double.infinity,
          ),
          TextField(
            controller: _controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  borderSide: BorderSide(
                    color: ShopColors.tabBarBorder,
                  )),
              border: InputBorder.none,
              hintText: _placeHolder,
              contentPadding: EdgeInsets.all(contentPadding),
              hintStyle: TextStyle(color: ShopColors.hintColor),
            ),
          ),
        ],
      ),
    );
  }
}
