// atmana tmla el file da ya 7awyaan

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopanizer/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // signin with email/password
  Future signInEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(result);
      User? user = result.user;
      return _shopUserFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //signup with email/password
    Future signUpEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print(result);
      User? user = result.user;
      return _shopUserFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }




  //Helper functions
  ShopUser? _shopUserFromFirebaseUser(User? user) {
    if(user == null) {
      return null;
    }
    return ShopUser(id: user.uid);
  }
}