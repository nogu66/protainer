import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_model.dart';

Widget Footer(BuildContext context, MainModel model) {
  return BottomNavigationBar(
    currentIndex: model.currentIndex,
    onTap: (index) {
      model.onItemTapped(index);
    },
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'ホーム',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.access_time),
        label: 'タイムライン',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: 'ランキング',
      ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.person),
      //   label: 'プロフィール',
      // ),
    ],
  );
}
