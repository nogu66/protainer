import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'footer_mode.dart';

class Footer extends StatelessWidget {
// class _Footer extends State<Footer> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FooterModel>(
      create: (_) => FooterModel(),
      child: Consumer<FooterModel>(builder: (context, model, child) {
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
          currentIndex: model.selectedIndex,
          selectedItemColor: Colors.black,
          onTap: model.onItemTapped,
          type: BottomNavigationBarType.fixed,
        );
      }),
    );
  }
}
