import 'package:flutter/material.dart';
import 'package:shopanizer/services/Auth.dart';


class SettingsTab extends StatelessWidget {
  static final screenName = "Settings";
  final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: TextButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Text("Logout")
          ),
        ),
      ),
    );
  }
}