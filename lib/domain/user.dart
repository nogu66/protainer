import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String id;
  String name;
  String introduction;
  String imageURL;
  Timestamp createdAt;
  Timestamp updatedAt;

  UserData(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, Object>;
    this.id = doc.id;
    this.name = data['name'];
    this.introduction = data['introduction'];
    this.imageURL = data['imageURL'];
    this.createdAt = data['createdAt'];
    this.updatedAt = data['updatedAt'];
  }
}
