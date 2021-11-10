
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDatabaseServive {
    Future updateUserData(String firstName, String lastName, String email) async {
    final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    return await userCollection.doc(uid).set({
      'firstName': firstName,
      'lastName' : lastName,
      'email'    : email,
    });
  }
}