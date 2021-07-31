import 'package:flutter/material.dart';
import 'package:shopanizer/widgets/textbox_with_label.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: TextBoxWithLabel(
            labelText: 'First Name',
            placeHolder: 'First Name',
          ),
        ),
      ),
    );
  }
}
