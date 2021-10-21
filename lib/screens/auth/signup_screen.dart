import 'package:flutter/material.dart';
import 'package:shopanizer/screens/auth/mobile_number_screen.dart';
import 'package:shopanizer/services/Auth.dart';
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

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
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
                  validatorFunc: (val) => val!.isEmpty ? 'Required' : null,
                  controller: _firstNameController,
                ),
                VerticalSpace(height: 15,),
                TextBoxWithLabel(
                  labelText: "Last Name",
                  placeHolder: "Last Name",
                  validatorFunc: (val) => val!.isEmpty ? 'Required' : null,
                  controller: _lastNameController,
                ),
                VerticalSpace(height: 15,),
                TextBoxWithLabel(
                  labelText: "Email",
                  placeHolder: "Email",
                  validatorFunc: (val) => val!.isEmpty ? 'Required' : null,
                  controller: _emailController,
                ),
                VerticalSpace(height: 15,),
                TextBoxWithLabel(
                  labelText: "Password",
                  placeHolder: "Password",
                  validatorFunc: (val) => val!.isEmpty ? 'Required' : null,
                  controller: _passwordController,
                ),
                VerticalSpace(height: 15,),
                TextBoxWithLabel(
                  labelText: "Confirm Password",
                  placeHolder: "Confirm Password",
                  validatorFunc: (val) => val!.isEmpty ? 'Required' : null,
                  controller: _confirmPasswordController,
                ),
                VerticalSpace(height: 15,),
                Container(
                  width: double.infinity,
                  child: RoundedCornerButton.text(
                    text: "Sign up",
                    backgroundColor: ShopColors.primary,
                    onPressed: () async {
                      if(_formKey.currentState!.validate()) {
                        print(_emailController.text);
                        print(_passwordController.text);
                        dynamic result = await _auth.signUpEmail(_emailController.text, _passwordController.text);
                        print("2");
                        if(result == null) {
                          print("Sign Up is failed");
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MobileNumberScreen()));
                        }
                      }
                    } 
                  ),
                ),
                VerticalSpace(height: 15,),
              ]
            )),
        )
      ),
    );
  }
}