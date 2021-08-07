import 'package:flutter/material.dart';
import 'package:shopanizer/screens/splash_screen.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
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
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: ShopColors.textColor),
            shadowColor: Colors.transparent
          ),
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: ShopColors.textColor,
              fontFamily: "Poppins"
            ),
          ),
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
