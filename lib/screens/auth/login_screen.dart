import 'package:flutter/material.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _firstNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: TextBoxWithLabel(
            controller: _firstNameController,
            labelText: 'First Name',
            placeHolder: 'First Name',
          ),
        ),
      ),
    );
  }
}
