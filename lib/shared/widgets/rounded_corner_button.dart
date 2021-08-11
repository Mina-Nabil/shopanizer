import 'package:flutter/material.dart';
import 'package:shopanizer/screens/home/new_group_screen.dart';
import 'package:shopanizer/shared/paths.dart';
import 'package:flutter_svg/svg.dart';

class RoundedCornerButton extends StatelessWidget {
  static const double radius = 20;

  final String text;
  final Function onPressCallback;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle buttonTextStyle;
  final String? iconPath;

  RoundedCornerButton({
    required this.text,
    required this.backgroundColor,
    required this.onPressCallback,
    this.textColor = Colors.white,
    this.buttonTextStyle = const TextStyle(fontWeight: FontWeight.w500),
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        children: [
          if (iconPath != null)
            SvgPicture.asset(
              Paths.checkIcon,
              color: textColor,
            ),
          SizedBox(
            width: 3.0,
          ),
          Text(
            text,
            style: TextStyle(color: textColor),
          )
        ],
      ),
      onPressed: () => onPressCallback(),
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          primary: backgroundColor,
          textStyle: buttonTextStyle),
    );
  }
}
