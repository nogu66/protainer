import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SetProfileModel extends ChangeNotifier {
  String name = '';
  String introduction = '';

  Future setProfile(uid) async {
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'name': name,
      'introduction': introduction,
      'updatedAt': Timestamp.now(),
    });
  }
}
