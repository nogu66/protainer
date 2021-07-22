import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddPostModel extends ChangeNotifier {
  String bodyText = '';
  File imageFile;
  bool isLoading = false;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future addPostToFirebase() async {
    // bodyText = FirebaseAuth.instance.currentUser.uid + bodyText;
    if (bodyText.isEmpty) {
      throw ('本文を入力してください');
    }
    final currentUser = FirebaseAuth.instance.currentUser;
    final imageURL = await _uploadImageFile();
    FirebaseFirestore.instance.collection('posts').add(
      {
        'userId': currentUser.uid,
        'bodyText': bodyText,
        'imageURL': imageURL,
        'createdAt': Timestamp.now(),
      },
    );
  }

  setImage(File imageFile) {
    this.imageFile = imageFile;
    notifyListeners();
  }

  Future<String> _uploadImageFile() async {
    if (imageFile == null) {
      return '';
    }
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('posts').child(bodyText);

    final snapshot = await ref
        .putFile(
          imageFile,
        )
        .snapshot;

    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}
