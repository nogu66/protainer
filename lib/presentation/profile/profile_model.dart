import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:protainer/domain/user.dart';

class ProfileModel extends ChangeNotifier {
  UserData user;
  // String uid;
  String name = '';
  String introduction = '';

  Future getUserProfile() async {
    // const currentUser = firebase.auth.currentUser!;
    final currentUser = FirebaseAuth.instance.currentUser;
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();
    this.user = UserData(snapshot);
    notifyListeners();
  }
}
