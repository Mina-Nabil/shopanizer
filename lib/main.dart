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
              iconTheme: IconThemeData(color: ShopColors.labelDarkBlue),
              shadowColor: Colors.transparent),
          textTheme: TextTheme(
            bodyText2: TextStyle(
                color: ShopColors.labelDarkBlue, fontFamily: "Poppins"),
          ),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: ShopColors.textFieldBG,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    width: 0.2,
                    color: ShopColors.textFieldBorder,
                    style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    width: 0.5,
                    color: ShopColors.textFieldBorder,
                    style: BorderStyle.solid),
              ))),
      home: SplashScreen(),
    );
  }
}
