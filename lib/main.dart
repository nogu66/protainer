import 'package:flutter/material.dart';
import 'package:protainer/footer.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Protainer',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Consumer<MainModel>(builder: (context, model, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.note_add,
            color: Colors.black,
          ),
          backgroundColor: Colors.yellow,
        ),
        // bottomNavigationBar: ,
        bottomNavigationBar: Consumer<MainModel>(
          builder: (context, model, child) {
            return Footer();
          },
        ),
      ),
    );
  }
}
