import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/photo_uploader.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';

class NewGroupScreen extends StatefulWidget {
  @override
  _NewGroupScreenState createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  TextEditingController _groupNameController = new TextEditingController();
  TextEditingController _groupDescController = new TextEditingController();

  File? _groupPhoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add new group",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  DoneButton(
                    onPressed: () {},
                  )
                ],
              ),
              _groupPhoto == null
                  ? PhotoUploader(onPhotoUpload: (image) {
                      setState(() {
                        _groupPhoto = File(image.path);
                      });
                    })
                  : CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 6,
                      backgroundImage: Image.file(
                        _groupPhoto!,
                        fit: BoxFit.fill,
                      ).image,
                    ),
              TextBoxWithLabel(
                controller: _groupNameController,
                labelText: "Group Name",
                placeHolder: "Group Name",
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Text("Add Participants"),
              Divider(),
              SizedBox(
                height: 20,
              ),
              TextBoxWithLabel(
                controller: _groupDescController,
                labelText: "Group Description",
                placeHolder: "Group Description",
                maxLines: 3,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
