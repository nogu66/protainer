import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:protainer/domain/protein.dart';

class HomeModel extends ChangeNotifier {
  List<Protein> proteins = [];

  Future getProteins() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('proteins')
        .orderBy('name')
        .limit(2)
        .get();
    final docs = snapshot.docs;
    final proteins = docs.map((doc) => Protein(doc)).toList();
    this.proteins = proteins;
    notifyListeners();
  }

  void getProteinsRealtime() {
    final snapshots =
        // FirebaseFirestore.instance.collection('proteins').snapshots();
        FirebaseFirestore.instance
            .collection('proteins')
            .orderBy('name', descending: true)
            .limit(2)
            .snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final proteins = docs.map((doc) => Protein(doc)).toList();
      this.proteins = proteins;
      notifyListeners();
    });
  }

  Future fetchProteins() async {
    final docs = await FirebaseFirestore.instance.collection('proteins').get();
    final proteins = docs.docs.map((doc) => Protein(doc)).toList();
    this.proteins = proteins;
    notifyListeners();
  }
}
