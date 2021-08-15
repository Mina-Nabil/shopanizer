import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';

class LabelText extends StatelessWidget {
  final String labelText;
  LabelText({required this.labelText});
  @override
  Widget build(BuildContext context) {
    return Text(labelText,
        textAlign: TextAlign.left,
        style: ShopTextStyles.s_r_3.copyWith(color: ShopColors.labelDarkBlue));
  }
}

class TitleTV1 extends StatelessWidget {
  final String titleText;
  TitleTV1({required this.titleText});
  @override
  Widget build(BuildContext context) {
    return Text(titleText,
        textAlign: TextAlign.left,
        style: ShopTextStyles.xl_b_1.copyWith(color: ShopColors.primary));
  }
}

class TitleTV2 extends StatelessWidget {
  final String titleText;
  TitleTV2({required this.titleText});
  @override
  Widget build(BuildContext context) {
    return Text(titleText,
        textAlign: TextAlign.left,
        style: ShopTextStyles.l_b_2.copyWith(color: ShopColors.labelDarkBlue));
  }
}
