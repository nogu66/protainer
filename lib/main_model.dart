import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
  int buttonSelectedIndex = 2;

  void onTappedBottomBar(int index) {
    buttonSelectedIndex = index;
    notifyListeners();
  }
}
