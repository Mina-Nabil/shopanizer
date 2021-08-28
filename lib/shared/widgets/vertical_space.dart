import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double height;

  VerticalSpace({this.height = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
    );
  }
}
