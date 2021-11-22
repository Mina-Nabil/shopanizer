import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopanizer/models/group.dart';
import 'package:shopanizer/services/GroupsDBService.dart';
import 'package:shopanizer/shared/widgets/TextViews.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/photo_picker.dart';
import 'package:shopanizer/shared/widgets/photo_viewer.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';

class NewGroupScreen extends StatefulWidget {
  @override
  _NewGroupScreenState createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _groupNameController = new TextEditingController();
  TextEditingController _groupDescController = new TextEditingController();

  File? _groupPhoto;

  addNewGroup() async {
    if(_formKey.currentState!.validate()) {
      ShopGroup newgroup = await Provider.of<GroupsProvider>(context, listen: false).addNewGroup(
        ShopGroup(
          name: _groupNameController.text,
          desc: _groupDescController.text,
          members: [FirebaseAuth.instance.currentUser!.uid]
        )
      );
      Navigator.pushReplacementNamed(context, '/group', arguments: newgroup);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add new group",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    DoneButton(
                      onPressed: addNewGroup,
                    )
                  ],
                ),
                Center(
                    child: _groupPhoto == null
                        ? PhotoPicker.circular(
                            radius: MediaQuery.of(context).size.width / 6,
                            onPhotoPicked: (image) {
                              setState(() {
                                _groupPhoto = File(image.path);
                              });
                            })
                        : PhotoViewer.circular(
                            image: Image.file(
                              _groupPhoto!,
                              fit: BoxFit.cover,
                            ),
                            radius: MediaQuery.of(context).size.width / 6,
                          )),
                TextBoxWithLabel(
                  controller: _groupNameController,
                  labelText: "Group Name",
                  placeHolder: "Group Name",
                  validatorFunc: (val) => val!.isEmpty ? 'Required' : null,
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                LabelTV1(text: "Add Participants"),
                Row(
                  children: [
                    PhotoViewer.circular(
                      image: Image.network(
                        "https://thumbs.dreamstime.com/b/fashion-model-wavy-hairstyle-attractive-young-girl-curly-hair-posing-studio-face-beautiful-woman-long-brown-female-196126449.jpg",
                        fit: BoxFit.cover,
                      ),
                      radius: MediaQuery.of(context).size.width / 12,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    PhotoViewer.circular(
                      image: Image.network(
                        "https://media.istockphoto.com/photos/red-haired-woman-with-voluminous-shiny-and-curly-hairstyleflying-hair-picture-id849234512?k=6&m=849234512&s=612x612&w=0&h=acnUHhmDmaxjC7laSE1D9C87uLh5-W8X4q7_eX2o69Y=",
                        fit: BoxFit.cover,
                      ),
                      radius: MediaQuery.of(context).size.width / 12,
                    ),
                  ],
                ),
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
      ),
    );
  }
}
