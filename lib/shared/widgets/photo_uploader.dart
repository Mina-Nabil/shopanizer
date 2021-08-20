
import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../paths.dart';

class PhotoUploader extends StatefulWidget {
  PhotoUploader.circular({required radius, required this.onPhotoUpload}) {
    size = radius*2;
    isCircular = true;
  }

  PhotoUploader.square({required this.size, required this.onPhotoUpload}) {
    isCircular = false;
  }
  
  late final double size;
  late final isCircular;
  final Function(XFile image) onPhotoUpload;

  @override
  _PhotoUploaderState createState() => _PhotoUploaderState();
}

class _PhotoUploaderState extends State<PhotoUploader> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          shape: widget.isCircular? BoxShape.circle : BoxShape.rectangle,
          border: Border.all(
            color: ShopColors.primary,
          ),
        ),
        child: ClipOval(
            child: AspectRatio(
          aspectRatio: 1.0,
          child: SvgPicture.asset(
            Paths.camera,
            fit: BoxFit.scaleDown,
            color: ShopColors.primary,
          ),
        )),
      ),
      onTap: () {
        getImage(ImageSource.camera);
      },
    );
  }

  getImage(ImageSource source) async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: source);
    if (image != null) widget.onPhotoUpload(image);
  }
}
