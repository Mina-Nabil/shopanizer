import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/screens/auth/signup_screen.dart';
import 'package:shopanizer/screens/home/main_screen.dart';
import 'package:shopanizer/services/Auth.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/auth/auth_header.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';
import 'package:shopanizer/shared/widgets/textviews.dart';
import 'package:shopanizer/shared/widgets/vertical_space.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 70),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader(),
                VerticalSpace(),
                TitleSmallTV1(
                  text: "Sign in to continue",
                ),
                VerticalSpace(),
                TextBoxWithLabel(
                  labelText: "Email",
                  placeHolder: "Email",
                  validatorFunc: (val) => val!.isEmpty ? 'Required' : null,
                  controller: _emailController,
                ),
                VerticalSpace(
                  height: 15,
                ),
                TextBoxWithLabel(
                  labelText: "Password",
                  placeHolder: "Password",
                  validatorFunc: (val) => val!.isEmpty ? 'Required' : null,
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
                    onPressed: () async {
                      if(_formKey.currentState!.validate()) {
                        dynamic result = await _auth.signInEmail(_emailController.text, _passwordController.text);
                        if(result == null) {
                          print("Sign Ip is failed");
                        } else {
                          //streambuilder will update view to main_screen
                          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
                        }
                      }
                    },
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
                    TextButton(
                      child:LabelTV2(text: "Sign up",color: ShopColors.labelBlue),
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignupScreen())),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
