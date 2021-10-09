import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/screens/auth/mobile_number_screen.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/auth/auth_header.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';
import 'package:shopanizer/shared/widgets/vertical_space.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeader(),
              VerticalSpace(),
              TitleSmallTV1(
                text: "Create New Account",
              ),
              VerticalSpace(),
              TextBoxWithLabel(
                labelText: "First Name",
                placeHolder: "First Name",
                controller: _firstNameController,
              ),
              VerticalSpace(height: 15,),
              TextBoxWithLabel(
                labelText: "Last Name",
                placeHolder: "Last Name",
                controller: _lastNameController,
              ),
              VerticalSpace(height: 15,),
              TextBoxWithLabel(
                labelText: "Email",
                placeHolder: "Email",
                controller: _emailController,
              ),
              VerticalSpace(height: 15,),
              TextBoxWithLabel(
                labelText: "Password",
                placeHolder: "Password",
                controller: _passwordController,
              ),
              VerticalSpace(height: 15,),
              TextBoxWithLabel(
                labelText: "Confirm Password",
                placeHolder: "Confirm Password",
                controller: _confirmPasswordController,
              ),
              VerticalSpace(height: 15,),
              Container(
                width: double.infinity,
                child: RoundedCornerButton.text(
                  text: "Sign up",
                  backgroundColor: ShopColors.primary,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MobileNumberScreen())),
                ),
              ),
            ]
          ))
      ),
    );
  }
}