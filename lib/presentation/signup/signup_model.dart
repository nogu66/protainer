import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpModel extends ChangeNotifier {
  String mail = '';
  String password = '';
  String name = '';
  String introduction = '';
  String uid = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp() async {
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }

    final User user = (await _auth.createUserWithEmailAndPassword(
      email: mail,
      password: password,
    ))
        .user;
    final email = user.email;
    this.uid = user.uid;

    // FirebaseFirestore.instance.collection('users').add({
    //   'email': email,
    //   'createdAt': Timestamp.now(),
    // });

    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': email,
      'createdAt': Timestamp.now(),
      // 'name': email,
      // 'introduction': introduction,
    });
  }
}
