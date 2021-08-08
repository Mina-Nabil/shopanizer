import 'package:flutter/material.dart';

class NewGroupScreen extends StatefulWidget {
  @override
  _NewGroupScreenState createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Text(
              "Add new group",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Container(
                child: Center(
              child: ElevatedButton(
                child: Text("PRESS"),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => NewGroupScreen()),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
