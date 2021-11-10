import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopanizer/screens/home/main_screen.dart';
import 'package:shopanizer/shared/themes/shopanizer_theme.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/photo_picker.dart';
import 'package:shopanizer/shared/widgets/photo_viewer.dart';
import 'package:shopanizer/shared/widgets/vertical_space.dart';


class AddPictureScreen extends StatefulWidget {
  const AddPictureScreen({ Key? key }) : super(key: key);

  @override
  _AddPictureScreenState createState() => _AddPictureScreenState();
}

class _AddPictureScreenState extends State<AddPictureScreen> {
  File? _Photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTV1(
                text: "Add your picture",
              ),
              VerticalSpace(height: 30,),
              Center(
                child: _Photo == null? PhotoPicker.circular(
                  radius: MediaQuery.of(context).size.width / 4,
                  hasBorder: false,
                  onPhotoPicked: (photo) {
                            setState(() {
                              _Photo = File(photo.path);
                            });
                          })
                  : PhotoViewer.circular(
                          image: Image.file(
                            _Photo!,
                            fit: BoxFit.cover,
                          ),
                          radius: MediaQuery.of(context).size.width / 4,
                        )
              ),
              VerticalSpace(height: 30,),
              Container(
                width: double.infinity,
                child: RoundedCornerButton.text(
                  text: "Next",
                  backgroundColor: ShopColors.primary,
                  onPressed: _Photo == null? null : () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen())),
                ),
              ),
              Center(
                child: TextButton(
                      child:LabelTV2(text: "Skip this step",color: ShopColors.labelBlue),
                      //onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen())),
                      onPressed: () => Navigator.pop(context),
                    ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}