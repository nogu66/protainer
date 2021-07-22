import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protainer/presentation/ranking/ranking_model.dart';
import 'package:provider/provider.dart';

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RankingModel>(
      create: (_) => RankingModel(),
      child: Scaffold(
        body: Consumer<RankingModel>(builder: (context, model, child) {
          return Column(
            children: [],
          );
        }),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: const Icon(
        //     Icons.note_add,
        //     color: Colors.black,
        //   ),
        //   // backgroundColor: Colors.yellow,
        // ),
        // bottomNavigationBar: ,
      ),
    );
  }
}
