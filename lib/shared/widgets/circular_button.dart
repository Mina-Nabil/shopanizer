import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {

  CircularButton(
    {
      @required this.child,
      this.radius = 12,
      @required this.backgroundColor,
      @required this.onPressed,
    }
  );
  final Widget? child;
  final double radius;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: radius*2,
          width: radius*2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: this.backgroundColor,
          ),
          child: FittedBox(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: child,
          )),
      ),
      onTap: onPressed,
    );
  }
}