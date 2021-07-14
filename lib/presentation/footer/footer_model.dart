import 'package:flutter/material.dart';

class FooterModel extends ChangeNotifier {
  int currentIndex = 0;

  void onItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
