import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/screens/home/main_screen.dart';
import 'package:shopanizer/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((_) {
      bool loggedIn = true;
      if(loggedIn) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SvgPicture.asset('assets/icons/splashIcon.svg'),
        ));
  }
}
