import 'package:flutter/material.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../paths.dart';

class PhotoPicker extends StatefulWidget {
  PhotoPicker.circular({radius, required this.onPhotoPicked, this.hasBorder = true}) {
    size = radius * 2;
    isCircular = true;
  }

  PhotoPicker.square({this.size, required this.onPhotoPicked, this.hasBorder = true}) {
    isCircular = false;
  }

  late final double? size;
  late final isCircular;
  final bool hasBorder;
  final Function(XFile image) onPhotoPicked;

  @override
  _PhotoPickerState createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          shape: widget.isCircular ? BoxShape.circle : BoxShape.rectangle,
          color: ShopColors.photopickerBG,
          border: widget.hasBorder? Border.all(
            color: ShopColors.primary,
          ) : null,
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
      onTap: () => _onTap()
    );
  }

  void _onTap() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) {
          return Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    child: InkWell(
                      child: Row(
                        children: [
                          Icon(
                            Icons.file_upload,
                            size: 26,
                            color: ShopColors.labelDarkBlue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Upload Photo",
                            style: TextStyle(
                                fontSize: 18, color: ShopColors.labelDarkBlue),
                          ),
                        ],
                      ),
                      onTap: () {
                        getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                    child: InkWell(
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 26,
                            color: ShopColors.labelDarkBlue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Take Photo",
                            style: TextStyle(
                              fontSize: 18,
                              color: ShopColors.labelDarkBlue,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        getImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ));
        });
  }

  getImage(ImageSource source) async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: source);
    if (image != null) widget.onPhotoPicked(image);
  }
}
