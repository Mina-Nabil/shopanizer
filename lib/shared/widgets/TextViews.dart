import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:readmore/readmore.dart';

class LabelTV1 extends StatelessWidget {
  final String text;
  LabelTV1({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left, style: ShopTextStyles.s_r_2.copyWith(color: ShopColors.labelDarkBlue));
  }
}

class LabelTV2 extends StatelessWidget {
  final String text;
  Color color;
  LabelTV2({required this.text, this.color = ShopColors.labelDarkBlue});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left, style: ShopTextStyles.s_r_3.copyWith(color: this.color));
  }
}

class TitleSmallTV1 extends StatelessWidget {
  final String text;
  TitleSmallTV1({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left, style: ShopTextStyles.s_r_3.copyWith(color: ShopColors.primary));
  }
}

class TitleTV1 extends StatelessWidget {
  final String text;
  TitleTV1({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left, style: ShopTextStyles.xl_b_1.copyWith(color: ShopColors.primary));
  }
}

class TitleTV2 extends StatelessWidget {
  final String text;
  TitleTV2({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left, style: ShopTextStyles.l_b_2.copyWith(color: ShopColors.labelDarkBlue));
  }
}

class TitleTV3 extends StatelessWidget {
  final String text;
  TitleTV3({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left, style: ShopTextStyles.l_extraBold_2.copyWith(color: ShopColors.labelDarkBlue));
  }
}

class LogoTV1 extends StatelessWidget {
  final String text;
  LogoTV1({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left, style: ShopTextStyles.m_m_1.copyWith(color: ShopColors.primary));
  }
}

class TileTitleTV extends StatelessWidget {
  final String text;
  TileTitleTV({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left, style: ShopTextStyles.m_m_1.copyWith(color: ShopColors.labelDarkBlue));
  }
}

class TileSubtitleTV extends StatelessWidget {
  final String text;
  TileSubtitleTV({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left, style: ShopTextStyles.s_r_3.copyWith(color: ShopColors.labelDarkBlue));
  }
}

class ReadMoreTextTV extends StatelessWidget {
  final String text;
  ReadMoreTextTV({required this.text});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(text,
        trimMode: TrimMode.Line,
        trimLines: 3,
        textAlign: TextAlign.left,
        style: ShopTextStyles.s_r_3.copyWith(color: ShopColors.labelDarkBlue));
  }
}
