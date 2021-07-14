import 'package:cloud_firestore/cloud_firestore.dart';

class Protein {
  Protein(DocumentSnapshot doc) {
    documentID = doc.id;

    final data = doc.data() as Map<String, Object>;

    this.name = data['name'];
    this.maker = data['maker'];
    this.imageURL = data['imageURL'];
  }

  String documentID;
  String name;
  String maker;
  String imageURL;
}
