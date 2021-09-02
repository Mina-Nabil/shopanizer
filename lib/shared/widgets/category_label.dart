import 'package:flutter/material.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/circular_icon.dart';

class CategoryLabel extends StatelessWidget {

  static const double _labelHeight = 30.0;
  static const double _verticalPadding = 3.0;
  static const double _horizontalPadding = 6.0;
  static const double _labeLRadius = 10.0;
  static const double _extraPadding = 4.0;

  final String text;
  final Color bgColor;
  final String? iconPath;
  final Color? iconColor;

  CategoryLabel({required this.text, required this.bgColor, this.iconPath, this.iconColor}){
    assert(this.iconPath==null || this.iconColor!=null, "Please set iconColor in case iconPath is used");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: _verticalPadding, horizontal: _horizontalPadding),
      height: _labelHeight,
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.all(Radius.circular(_labeLRadius))),
      child: Wrap(
        children: [
          if(this.iconPath!=null)
              CircularIcon(iconPath: this.iconPath ?? "" /* iconPath should always contain a value here */, iconColor: this.iconColor ?? Colors.transparent, backgroundColor: Colors.transparent),
   
          Padding(
            padding: const EdgeInsets.only(right: _extraPadding),
            child: Text(text),
          )],
      ),
    );
  }
}