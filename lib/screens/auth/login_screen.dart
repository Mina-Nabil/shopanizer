import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';
import 'package:shopanizer/shared/widgets/textviews.dart';
import 'package:shopanizer/shared/widgets/vertical_space.dart';

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
        padding: EdgeInsets.only(left: 15, right: 15, top: 70),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 37,
                height: 28,
                child: SvgPicture.asset(Paths.logoIcon),
              ),
              VerticalSpace(),
              LogoTV1(
                text: "welcome to",
              ),
              TitleTV1(
                text: "Shopanizer",
              ),
              VerticalSpace(),
              TitleSmallTV1(
                text: "Sign in to continue",
              ),
              VerticalSpace(),
              TextBoxWithLabel(
                labelText: "Email",
                placeHolder: "Email",
                controller: _emailController,
              ),
              VerticalSpace(
                height: 15,
              ),
              TextBoxWithLabel(
                labelText: "Password",
                placeHolder: "Password",
                controller: _passwordController,
              ),
              VerticalSpace(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: RoundedCornerButton.text(
                  text: "Sign in",
                  backgroundColor: ShopColors.primary,
                  onPressed: () {},
                ),
              ),
              VerticalSpace(
                height: 20,
              ),
              Center(
                child: LabelTV1(text: "Sign in with"),
              ),
              VerticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularButton(
                    child: SvgPicture.asset(Paths.fbBlueBGIcon),
                    backgroundColor: Colors.transparent,
                    onPressed: () {},
                    radius: 20,
                  ),
                  CircularButton(
                    child: SvgPicture.asset(Paths.gmailRedBGIcon),
                    backgroundColor: Colors.transparent,
                    onPressed: () {},
                    radius: 20,
                  ),
                ],
              ),
              VerticalSpace(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LabelTV2(text: "Don't have an account "),
                  LabelTV2(
                    text: "Sign up",
                    color: ShopColors.labelBlue,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
