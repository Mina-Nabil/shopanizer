import 'package:flutter/material.dart';

import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';

class DropDownWithLabel extends StatelessWidget {
  static const borderRadius = 20.0;

  final String _labelText;
  final List<DropdownMenuItem<int>> _items;
  final Function? _onChangedCallback;
  final int _value;

  DropDownWithLabel({
    required String labelText,
    required String placeHolder,
    required List<DropdownMenuItem<int>> items,
    required Function? onChangedCallback,
    required int value,
  })  : this._labelText = labelText,
        this._items = items,
        this._onChangedCallback = onChangedCallback,
        this._value = value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            child: LabelTV1(text: _labelText),
          ),
          Container(
            height: 10,
            width: double.infinity,
          ),
          DropdownButtonFormField(
            value: _value,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                  borderSide: BorderSide(
                    color: ShopColors.tabBarBorder,
                  )),
              border: InputBorder.none,
              hintStyle: TextStyle(color: ShopColors.hintColor),
            ),
            items: _items,
            onChanged: (index) => _onChangedCallback!(index),
          ),
        ],
      ),
    );
  }
}
