import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopanizer/screens/splash_screen.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //Theme constant values

  final double inputBorderFocuedWidth = 0.5;
  final double inputBorderEnabledWidth = 0.2;


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future _initialization = Firebase.initializeApp();
  

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
              bodyText2: TextStyle(color: ShopColors.labelDarkBlue, fontFamily: "Poppins"),
            ),
            inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: ShopColors.textFieldBG,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintStyle: TextStyle(color: ShopColors.hintColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: widget.inputBorderEnabledWidth, color: ShopColors.textFieldBorder, style: BorderStyle.solid),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: widget.inputBorderEnabledWidth, color: ShopColors.red, style: BorderStyle.solid),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: widget.inputBorderFocuedWidth, color: ShopColors.red, style: BorderStyle.solid),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: widget.inputBorderFocuedWidth, color: ShopColors.textFieldBorder, style: BorderStyle.solid),
                ))),
        home: FutureBuilder(
            future: _initialization,
            builder: (cnxt, snapshot) {
              if (snapshot.hasError) {
                return Text("Failed");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return SplashScreen();
              }
              // Otherwise, show something whilst waiting for initialization to complete
              return Container(
                width: 100,
                height: 200,
                color: Colors.white,
                alignment: Alignment.center,
                child: SpinKitFadingFour(itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: ShopColors.green,
                    ),
                  );
                }),
              );
            }));
  }
}
