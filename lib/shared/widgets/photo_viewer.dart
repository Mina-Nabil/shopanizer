import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  ImageViewer.circular({required this.image, required this.radius});
  final Image image;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipOval(
          child: image,
        ),
      ),
    );
  }
}
