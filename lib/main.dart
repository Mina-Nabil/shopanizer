import 'package:flutter/material.dart';
import 'package:shopanizer/Themes/shopanizer_theme.dart';
import 'package:shopanizer/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopanizer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: ShopColors.primary,
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: ShopColors.textInputBG,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    width: 0.2,
                    color: ShopColors.textInputBorder,
                    style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    width: 0.5,
                    color: ShopColors.textInputBorder,
                    style: BorderStyle.solid),
              ))),
      home: SplashScreen(),
    );
  }
}
