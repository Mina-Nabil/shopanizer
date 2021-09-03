import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(
            Icons.search,
            color: ShopColors.hintColor,
          ),
          hintStyle: TextStyle(
            color: ShopColors.hintColor,
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: "Search"),
    );
  }
}
