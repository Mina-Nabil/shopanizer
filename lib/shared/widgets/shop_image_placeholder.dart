import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';

class ShopImagePlaceholder extends StatelessWidget {
  const ShopImagePlaceholder({
    required double height,
    required double width,
  })  : _height = height,
        _width = width;

  final double _height;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(2.0),
        height: _height,
        width: _width,
        color: ShopColors.primary.withAlpha((255 * .3).toInt()),
        child: Center(
            child: Icon(
          Icons.photo_size_select_actual_outlined,
          color: Colors.white,
        )));
  }
}
