import 'package:flutter/material.dart';

class ShopColors {
  ///#3D4596  , 100%
  static const Color primary = Color(0xFF3D4596);

  ///#94EF60  , 100%
  static const Color green = Color(0xFF94EF60);

  ///#FFBE0B  , 100%
  static const Color yellow = Color(0xFFFFBE0B);

  ///#3D4596 , 2%
  static Color textFieldBG = primary.withAlpha(5);

  ///#3D4596 , 30%
  static Color textFieldBorder = primary.withAlpha(76);

  ///#1B1F48 , 100%
  static Color labelDarkBlue = Color(0xFF1B1F48);

  ///#3D6BFF , 100%
  static Color labelBlue = Color(0xFF3D6BFF);

  ///#1B1F48 , 30%
  static Color hintColor = labelDarkBlue.withAlpha(76); // alpha 30%

  ///#FAFAFA , 100%
  static Color tabBarBG = Color(0xFFFAFAFA);

  ///#3809A3 , 100%
  static Color tabBarBorder = Color(0xFF3809A3);

  static Color unSelectedTab = primary.withAlpha(76);

  ///#3BF2A3 , 100%
  static Color greenButton = Color(0xFF3BF2A3);

  ///#37CCF4 , 100%
  static Color blueButton = Color(0xFF37CCF4);

  ///#3D4596 , 3%
  static Color primary3Precent = primary.withAlpha(7); // alpha 3%

}

class ShopTextStyles {
  /// Font Size : 8  ,  Font Weight : Regular
  static const TextStyle s_r_1 =
      TextStyle(fontSize: 8, fontWeight: FontWeight.normal);

  /// Font Size : 10  ,  Font Weight : Regular
  static const TextStyle s_r_2 =
      TextStyle(fontSize: 10, fontWeight: FontWeight.normal);

  /// Font Size : 12  ,  Font Weight : Regular
  static const TextStyle s_r_3 =
      TextStyle(fontSize: 12, fontWeight: FontWeight.normal);

  /// Font Size : 14  ,  Font Weight : Regular
  static const TextStyle m_r_1 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.normal);

  /// Font Size : 16  ,  Font Weight : Regular
  static const TextStyle m_r_2 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.normal);

  /// Font Size : 18  ,  Font Weight : Regular
  static const TextStyle m_r_3 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.normal);

  /// Font Size : 20  ,  Font Weight : Regular
  static const TextStyle l_r_1 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.normal);

  /// Font Size : 22  ,  Font Weight : Regular
  static const TextStyle l_r_2 =
      TextStyle(fontSize: 22, fontWeight: FontWeight.normal);

  /// Font Size : 22  ,  Font Weight : Bold
  static const TextStyle l_b_2 =
      TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold);

  /// Font Size : 24  ,  Font Weight : Regular
  static const TextStyle l_r_3 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.normal);

  /// Font Size : 26  ,  Font Weight : Regular
  static const TextStyle xl_r_1 =
      TextStyle(fontSize: 26, fontWeight: FontWeight.normal);

  /// Font Size : 26  ,  Font Weight : Bold
  static const TextStyle xl_b_1 =
      TextStyle(fontSize: 26, fontWeight: FontWeight.normal);

  /// Font Size : 28  ,  Font Weight : Regular
  static const TextStyle xl_r_2 =
      TextStyle(fontSize: 28, fontWeight: FontWeight.normal);

  /// Font Size : 30  ,  Font Weight : Regular
  static const TextStyle xl_r_3 =
      TextStyle(fontSize: 30, fontWeight: FontWeight.normal);

  /// Font Size : 32  ,  Font Weight : Regular
  static const TextStyle xxl_r_1 =
      TextStyle(fontSize: 32, fontWeight: FontWeight.normal);
}
