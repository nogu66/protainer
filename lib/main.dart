import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:protainer/footer.dart';
// import 'package:protainer/presentation/footer/footer_model.dart';
import 'package:protainer/presentation/home/home_page.dart';
import 'package:protainer/presentation/profile/profile_page.dart';
import 'package:protainer/presentation/timeline/timeline_page.dart';
import 'package:provider/provider.dart';

import 'appbar.dart';
import 'drawer.dart';
import 'main_model.dart';
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
        primaryColor: Colors.black,
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
    // ProfilePage(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      // create: (_) => MainModel(),
      create: (_) => MainModel()..getUserProfile(),
      // create: (_) => MainModel()..getUserProfileRealtime(),
      child: Consumer<MainModel>(builder: (context, model, child) {
        model.getUserProfile();
        final user = model.user;
        return WillPopScope(
          onWillPop: _willPopCallback,
          child: Scaffold(
            key: _scaffoldKey,
            appBar: appbar(context, user, _scaffoldKey),
            drawer: DrawerMenu(context, user),
            body: _pageList[model.currentIndex],
            bottomNavigationBar: Footer(context, model),
          ),
        );
      }),
    );
  }

  Future<bool> _willPopCallback() async {
    return true;
  }
}
