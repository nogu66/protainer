import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:protainer/domain/user.dart';

class MainModel extends ChangeNotifier {
  UserData user;
  int currentIndex = 0;

  void onItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future getUserProfile() async {
    final currentUser = await FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      user = UserData(snapshot);
    }
    notifyListeners();
  }

  // void getUserProfileRealtime() {
  //   final currentUser = FirebaseAuth.instance.currentUser;
  //   final snapshots = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(currentUser.uid)
  //       .snapshots();
  //   print(snapshots);
  //   // snapshots.listen((snapshot) {
  //   //   final docs = snapshots.docs;
  //   // })
  //   // this.user = UserData(snapshots.);
  //   // this.user = UserData(snapshot);
  //   // snapshots.listen((snapshot) {
  //   //   final user = UserData(snapshot);
  //   //   print(user);
  //   //   this.user = user;
  //   //   notifyListeners();
  //   // });
  //   // this.user = UserData(snapshot);
  // }
}
