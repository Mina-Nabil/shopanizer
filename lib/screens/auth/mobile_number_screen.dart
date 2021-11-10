import 'package:flutter/material.dart';
import 'package:shopanizer/screens/auth/verification_code_screen.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/vertical_space.dart';

class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTV1(
                text: "Enter your mobile number",
              ),
              VerticalSpace(),
              TitleSmallTV1(
                text: "We will send you a verification code",
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  child: Row(
                children: [
                  Text(
                    "+20",
                    style: TextStyle(color: ShopColors.primary, fontSize: 28),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "000 00000000",
                        hintStyle: TextStyle(
                            color: ShopColors.primary.withAlpha(50),
                            fontSize: 28),
                            
                      ),
                      style: TextStyle(color: ShopColors.primary.withAlpha(50),fontSize: 28),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              )),

              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: RoundedCornerButton.text(
                  text: "Next",
                  backgroundColor: ShopColors.primary,
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              VerificationCodeScreen())),
                ),
              ),
              Center(
                child: TextButton(
                      child:LabelTV2(text: "Skip this step",color: ShopColors.labelBlue),
                      onPressed: () {},
                    ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
