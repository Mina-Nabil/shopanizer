import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/vertical_space.dart';


class AuthHeader extends StatelessWidget {
  const AuthHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}