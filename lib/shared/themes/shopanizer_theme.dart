import 'package:flutter/material.dart';

class ShopColors {
  static const Color primary = Color(0xFF3D4596);
  static const Color blue = Color(0xFF37CCF4);
  static const Color green = Color(0xFF94EF60);

  static Color textInputBG = primary.withAlpha(5); // alpha 2%
  static Color textInputBorder = primary.withAlpha(76); // alpha 30%

  static Color textColor = Color(0xFF1B1F48);
  static Color placeHolderColor = textColor.withAlpha(76); // alpha 30%

  static Color tabBarBG = Color(0xFFFAFAFA);
  static Color tabBarBorder = Color(0xFF3809A3);
  static Color unSelectedTab = primary.withAlpha(76); // alpha 30%
}


class ShopFonts {
  static const TextStyle titleStyle = TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold);
}
