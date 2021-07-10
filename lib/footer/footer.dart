import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<Footer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.access_time,
          ),
          label: 'タイムライン',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.star,
          ),
          label: 'ランキング',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'マイページ',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
