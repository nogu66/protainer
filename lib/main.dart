import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:protainer/presentation/footer/footer_model.dart';
import 'package:protainer/presentation/home/home_page.dart';
import 'package:protainer/presentation/profile/profile_page.dart';
import 'package:protainer/presentation/timeline/timeline_page.dart';
import 'package:provider/provider.dart';

import 'presentation/ranking/ranking_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Widget> _pageList = <Widget>[
    HomePage(),
    TimelinePage(),
    RankingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FooterModel>(
      create: (_) => FooterModel(),
      child: Consumer<FooterModel>(builder: (context, model, child) {
        return Scaffold(
          body: _pageList[model.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
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
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'プロフィール',
              ),
            ],
          ),
        );
      }),
    );
  }
}
