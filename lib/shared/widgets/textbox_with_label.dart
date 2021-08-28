import 'package:flutter/material.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';

class TextBoxWithLabel extends StatelessWidget {
  //default dimensions
  final labelFontSize = 14.0;
  final space = 10.0;

  final String _labelText;
  final String _placeHolder;
  final TextEditingController _controller;
  final String? Function(String? input)? validatorFunc;
  final int maxLines;

  TextBoxWithLabel(
      {required String labelText,
      required String placeHolder,
      required TextEditingController controller,
      this.validatorFunc,
      this.maxLines = 1})
      : this._labelText = labelText,
        this._controller = controller,
        this._placeHolder = placeHolder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            child: LabelText(
              labelText: _labelText,
            ),
          ),
          Container(
            height: space,
            width: double.infinity,
          ),
          TextFormField(
            controller: _controller,
            maxLines: maxLines,
            validator: validatorFunc,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: _placeHolder,
            ),
          ),
        ],
      ),
    );
  }
}
