import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopanizer/screens/auth/login_screen.dart';
import 'package:shopanizer/screens/home/main_screen.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({ Key? key }) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          return MainScreen();
        } else {
          return LoginScreen();
        }
      }
    );
  }

}
