import 'package:flutter/material.dart';

class PhotoViewer extends StatelessWidget {
  PhotoViewer.circular({required this.image, radius}) {
    size = (radius != null)? radius*2 : null;
    isCircular = true;
  }

  PhotoViewer.square({required this.image, this.size}) {
    isCircular = false;
  }

  late final isCircular;
  final Image image;
  late final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: isCircular ? ClipOval(child: image) : image,
    );
  }
}
