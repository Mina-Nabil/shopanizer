import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopanizer/models/list_model.dart';
import 'package:shopanizer/screens/home/list_screen.dart';
import 'package:shopanizer/services/DatabaseService.dart';
import 'package:shopanizer/services/GroupsDBService.dart';
import 'package:shopanizer/shared/widgets/buttons.dart';
import 'package:shopanizer/shared/widgets/photo_picker.dart';
import 'package:shopanizer/shared/widgets/photo_viewer.dart';
import 'package:shopanizer/shared/widgets/textbox_with_label.dart';

class NewListScreen extends StatefulWidget {

  NewListScreen({this.parentId="", this.parentType = ShopCollection.GROUP});
  String parentId;
  ShopCollection parentType;
  @override
  _NewListScreenState createState() => _NewListScreenState();
}

class _NewListScreenState extends State<NewListScreen> {
  TextEditingController _listNameController = new TextEditingController();
  TextEditingController _listDescController = new TextEditingController();
  File? _listPhoto;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add new list",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  DoneButton(
                    onPressed: () async {
                      ShopList newList = new ShopList(name: _listNameController.text);
                      ShopList addedList;
                      if(widget.parentType == ShopCollection.GROUP) {
                        addedList = await Provider.of<CurrentUser>(context, listen: false).addListToGroup(widget.parentId, newList);
                      } else if(widget.parentType == ShopCollection.LIST){
                        // If parent in list
                        addedList = await DatabaseHelper.createNewListInList(widget.parentId, newList);
                      } else {
                        // If parent in current user
                        addedList = await DatabaseHelper.createNewUserList(widget.parentId, newList);
                        Provider.of<CurrentUser>(context, listen: false).addNewList(addedList);
                      }
                      Navigator.pushReplacementNamed(context, '/list', arguments: addedList);
                    },
                  )
                ],
              ),
              Center(child: listPhoto()),
              TextBoxWithLabel(
                controller: _listNameController,
                labelText: "List Name",
                placeHolder: "List Name",
              ),
              SizedBox(
                height: 20,
              ),
              TextBoxWithLabel(
                  controller: _listDescController,
                  labelText: "List Description",
                  placeHolder: "List Description",
                  maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listPhoto() {
    return _listPhoto == null
        ? PhotoPicker.circular(
            radius: MediaQuery.of(context).size.width / 6,
            onPhotoPicked: (image) {
              setState(() {
                _listPhoto = File(image.path);
              });
            })
        : PhotoViewer.circular(
            image: Image.file(
              _listPhoto!,
              fit: BoxFit.cover,
            ),
            radius: MediaQuery.of(context).size.width / 6,
          );
  }
}
