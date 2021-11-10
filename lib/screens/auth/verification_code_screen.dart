import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopanizer/screens/auth/finish_signup_screen.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/vertical_space.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

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
                text: "Enter the code sent to your mobile number",
              ),
              VerticalSpace(),
              TitleSmallTV1(
                text: "The verification code sen to number +20 xxx xxxxxxxxx",
              ),
              SizedBox(
                height: 30,
              ),
              PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (_) => {},
                cursorColor: ShopColors.primary,
                pinTheme: PinTheme(
                  activeColor: ShopColors.primary,
                  activeFillColor: ShopColors.primary,
                  inactiveColor: ShopColors.primary,
                  selectedFillColor: ShopColors.primary,
                  selectedColor: ShopColors.primary,
                  fieldOuterPadding: EdgeInsets.all(1),
                ),
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
              ),
              VerticalSpace(),
              Container(
                width: double.infinity,
                child: RoundedCornerButton.text(
                  text: "Next",
                  backgroundColor: ShopColors.primary,
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              FinishSignupScreen())),
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
