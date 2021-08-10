import 'package:flutter/material.dart';

import '../Themes/shopanizer_theme.dart';

class TextBoxWithLabel extends StatelessWidget {
  final String _labelText;
  final String _placeHolder;
  final TextEditingController _controller;

  TextBoxWithLabel({required String labelText, required String placeHolder, required TextEditingController controller})
      : this._labelText = labelText,
        this._controller = controller,
        this._placeHolder = placeHolder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
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
          TextField(
            controller: _controller,
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: _placeHolder,
              hintStyle: TextStyle(color: ShopColors.placeHolderColor),
            ),
          ),
        ],
      ),
    );
  }
}
