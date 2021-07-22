import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protainer/presentation/add_post/add_post_page.dart';
import 'package:protainer/presentation/timeline/timeline_model.dart';
import 'package:provider/provider.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimelineModel>(
      create: (_) => TimelineModel(),
      child: Scaffold(
        body: Consumer<TimelineModel>(builder: (context, model, child) {
          return Column(
            children: [],
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.note_add,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPostPage(),
              ),
            );
          },
          // backgroundColor: Colors.yellow,
        ),
        // bottomNavigationBar: ,
      ),
    );
  }
}
