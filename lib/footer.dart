import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';

class Footer extends StatelessWidget {
  Footer(this.model);
  MainModel model;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'ホーム',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.access_time,
          ),
          label: 'タイムライン',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.star,
          ),
          label: 'ランキング',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'マイページ',
          backgroundColor: Colors.yellow,
        ),
      ],
      currentIndex: model.buttonSelectedIndex,
      selectedItemColor: Colors.black,
      onTap: model.onTappedBottomBar,
      type: BottomNavigationBarType.fixed,
    );
  }
}
