import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:protainer/domain/posts.dart';
import 'package:protainer/domain/user.dart';

class TimelineModel extends ChangeNotifier {
  List<Posts> posts = [];
  UserData user;
  String userName;
  String userIcon;

  Future fetchTimeline() async {
    final docs = await FirebaseFirestore.instance.collection('posts').get();
    final posts = docs.docs.map((doc) => Posts(doc)).toList();
    this.posts = posts;
    notifyListeners();
  }

  void getPostsRealtime() async {
    final snapshots =
        await FirebaseFirestore.instance.collection('posts').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final posts = docs.map((doc) => Posts(doc)).toList();
      posts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      this.posts = posts;
      notifyListeners();
    });
  }

  Future<void> getUserName(userID) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    this.user = UserData(snapshot);
    this.userName = user.name;
    notifyListeners();
  }

  Future<void> getUserIcon(userID) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    this.user = UserData(snapshot);
    this.userIcon = user.imageURL;
    notifyListeners();
  }
}
