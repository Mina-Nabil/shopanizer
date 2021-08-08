import 'package:flutter/material.dart';
import 'package:shopanizer/screens/home/new_group_screen.dart';

class AddNewItemScreen extends StatefulWidget {
  const AddNewItemScreen({Key? key}) : super(key: key);

  @override
  _AddNewItemScreenState createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: ElevatedButton(
        child: Text("PRESS"),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => NewGroupScreen()),
        ),
      ),
    ));
  }
}
