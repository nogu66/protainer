import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:protainer/domain/user.dart';

class ProfileModel extends ChangeNotifier {
  UserData user;
  // String uid;
  String name = '';
  String introduction = '';

  Future getUserProfile() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      this.user = UserData(snapshot);
    }
    notifyListeners();
  }
}
