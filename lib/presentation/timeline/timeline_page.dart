import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protainer/presentation/timeline/timeline_model.dart';
import 'package:provider/provider.dart';

import '../footer/footer.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimelineModel>(
      create: (_) => TimelineModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Protainer',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Consumer<TimelineModel>(builder: (context, model, child) {
          return Column(
            children: [],
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
