import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:protainer/domain/user.dart';

class Posts {
  Posts(DocumentSnapshot doc) {
    documentID = doc.id;

    final data = doc.data() as Map<String, Object>;
    userID = data['userID'];
    body = data['body'];
    imageURL = data['imageURL'];
    final Timestamp timestamp = data['createdAt'];
    this.createdAt = timestamp.toDate();
  }

  String documentID;
  String userName;
  String userIcon;
  String userID;
  String body;
  String imageURL;
  DateTime createdAt;
}
