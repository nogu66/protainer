import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protainer/presentation/add_post/add_post_page.dart';
import 'package:protainer/presentation/timeline/timeline_model.dart';
import 'package:provider/provider.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimelineModel>(
      create: (_) => TimelineModel()..getPostsRealtime(),
      child: Scaffold(
        backgroundColor: Colors.yellow,
        body: Consumer<TimelineModel>(builder: (context, model, child) {
          final posts = model.posts;
          return ListView(
            children: posts
                .map((post) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              // postUserHeader(context, model, post.userID),
                              // _postUserHeader(context, model, post.userID),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  post.imageURL,
                                  width: double.infinity,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Colors.grey,
                                ))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    post.body,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
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

Widget postUserHeader(
    BuildContext context, TimelineModel model, String userID) {
  return model.userName == null && model.userIcon == null
      ? Container()
      : Row(
          children: [
            Image.network(
              model.userIcon,
              width: 50,
              height: 50,
            ),
            Text(model.userName),
          ],
        );
}
