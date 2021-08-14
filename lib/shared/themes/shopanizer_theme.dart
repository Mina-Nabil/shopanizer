import 'package:flutter/material.dart';

class ShopColors {

  static const Color primary = Color(0xFF3D4596);
  static const Color green = Color(0xFF94EF60);
  static const Color yellow = Color(0xFFFFBE0B);

  static Color textInputBG = primary.withAlpha(5); // alpha 2%
  static Color textInputBorder = primary.withAlpha(76); // alpha 30%

  static Color labelColor = Color(0xFF1B1F48);
  static Color textBlue = Color(0xFF3D6BFF);
  static Color hintColor = labelColor.withAlpha(76); // alpha 30%

  static Color tabBarBG = Color(0xFFFAFAFA);
  static Color tabBarBorder = Color(0xFF3809A3);
  static Color unSelectedTab = primary.withAlpha(76); // alpha 30%


  static Color greenButton = Color(0xFF3BF2A3);
  static Color blueButton = Color(0xFF37CCF4);

  static Color propertyTilePurpleBgColor = primary.withAlpha(7); // alpha 30%

}


class ShopFonts {
  static const TextStyle titleStyle = TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold);
}
