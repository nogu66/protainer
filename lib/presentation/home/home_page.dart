import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (_) => HomeModel()..getProteinsRealtime(),
      child: Scaffold(
        body: Consumer<HomeModel>(builder: (context, model, child) {
          final proteins = model.proteins;
          // final ListTiles = proteins
          //     .map((protein) => ListTile(
          //           leading: Image.network(protein.imageURL),
          //           title: Column(
          //             children: [
          //               Text(protein.name),
          //               Text(protein.maker),
          //             ],
          //           ),
          //         ))
          //     .toList();
          final ListTiles = proteins
              .map(
                (protein) => ListTile(
                  leading: Image.network(protein.imageURL),
                  title: Column(
                    children: [
                      Text(protein.name),
                      Text(protein.maker),
                    ],
                  ),
                ),
              )
              .toList();
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('お気に入りのプロテインを探す'),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: ListTiles,
              ),
            ],
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
      ),
    );
  }

  Future _showDialog(
    BuildContext context,
    String title,
  ) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
