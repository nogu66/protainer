import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protainer/presentation/footer/footer.dart';
import 'package:protainer/presentation/profile/profile_model.dart';
import 'package:protainer/presentation/ranking/ranking_model.dart';
import 'package:protainer/presentation/timeline/timeline_model.dart';
import 'package:provider/provider.dart';

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Protainer',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Consumer<ProfileModel>(builder: (context, model, child) {
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
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
