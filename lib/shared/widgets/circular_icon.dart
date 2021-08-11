import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircularIcon extends StatelessWidget {
  static const double defaultPadding = 7.0;
  static const double defaultRadius = 12.5;
  static const double defaultColor = 12.5;


  final String iconPath;
  final double radius;
  final double padding;
  final Color iconColor;
  final Color backgroundColor;

  CircularIcon({
    required this.iconPath,
    required this.iconColor,
    required this.backgroundColor,
    this.radius = defaultRadius,
    this.padding = defaultPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: radius * 2,
        width: radius * 2,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: this.backgroundColor,
        ),
        child: FittedBox(child: SvgPicture.asset(iconPath)),
      ),
    );
  }
}
