import 'package:flutter/material.dart';

import '../Themes/shopanizer_theme.dart';

class DropDownWithLabel extends StatelessWidget {
  static const borderRadius = 20.0;

  final String _labelText;
  final List<DropdownMenuItem<int>> _items;
  final Function? _onChangedCallback;
  final int _value;

  final double margin;

  DropDownWithLabel(
      {required String labelText, required String placeHolder, required List<DropdownMenuItem<int>> items, required Function? onChangedCallback, required int value, this.margin = 10})
      : this._labelText = labelText,
        this._items = items,
        this._onChangedCallback = onChangedCallback,
        this._value = value;

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
            child: Text(
              _labelText,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: ShopColors.textColor,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
            ),
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
              hintStyle: TextStyle(color: ShopColors.placeHolderColor),
            ),
            items: _items,
            onChanged: (index) => _onChangedCallback!(index) ,
          ),
        ],
      ),
    );
  }
}
