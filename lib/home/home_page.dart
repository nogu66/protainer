import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protainer/home/home_model.dart';
import 'package:provider/provider.dart';

import '../footer/footer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (_) => HomeModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Protainer',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Consumer<HomeModel>(builder: (context, model, child) {
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
          // backgroundColor: Colors.yellow,
        ),
        // bottomNavigationBar: ,
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
