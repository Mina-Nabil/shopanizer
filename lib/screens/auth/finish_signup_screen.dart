import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/screens/auth/add_picture_screen.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/vertical_space.dart';


class FinishSignupScreen extends StatelessWidget {
  const FinishSignupScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 80),
        child: SingleChildScrollView(
          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleTV1(
                text: "Congratulations!",
              ),
              VerticalSpace(height: 20,),
              SvgPicture.asset("assets/icons/congratulations.svg"),
              VerticalSpace(height: 20,),
              TitleSmallTV1(
                text: "You account has been created successfully",
              ),
              VerticalSpace(height: 20,),
              Container(
                width: double.infinity,
                child: RoundedCornerButton.text(
                  text: "Next",
                  backgroundColor: ShopColors.primary,
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              AddPictureScreen())),
                ),
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}