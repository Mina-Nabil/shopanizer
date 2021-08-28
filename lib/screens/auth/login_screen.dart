import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextBoxWithLabel(
                labelText: "Email",
                placeHolder: "Email",
                controller: _emailController,
              ),
              Container(
                width: double.infinity,
                height: 10,
              ),
              TextBoxWithLabel(
                labelText: "Password",
                placeHolder: "Password",
                controller: _passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
