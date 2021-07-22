import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:protainer/presentation/add_post/add_post_model.dart';
import 'package:provider/provider.dart';

class AddPostPage extends StatelessWidget {
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    return ChangeNotifierProvider<AddPostModel>.value(
      // create: (_) => AddPostModel(),
      value: AddPostModel(),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.yellow,
              ),
              title: Text(
                '新規投稿',
                style: TextStyle(
                  color: Colors.yellow,
                ),
              ),
            ),
            body: Consumer<AddPostModel>(builder: (context, model, child) {
              return Column(
                children: [
                  InkWell(
                    onTap: () async {
                      final pickedFile = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      model.setImage(File(pickedFile.path));
                    },
                    child: SizedBox(
                      width: 150,
                      height: 240,
                      child: model.imageFile != null
                          ? Image.file(model.imageFile)
                          : Container(
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  TextField(
                    controller: textEditingController,
                    onChanged: (text) {
                      model.bodyText = text;
                    },
                  ),
                  ElevatedButton(
                    child: Text('投稿'),
                    onPressed: () async {
                      model.startLoading();
                      await addPost(model, context);
                      model.endLoading();
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            }),
            // bottomNavigationBar: ,
          ),
          Consumer<AddPostModel>(
            builder: (context, model, child) {
              return model.isLoading
                  ? Container(
                      color: Colors.black.withOpacity(0.3),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SizedBox();
            },
          )
        ],
      ),
    );
  }

  Future addPost(AddPostModel model, BuildContext context) async {
    try {
      await model.addPostToFirebase();
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('投稿しました！'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(e.toString()),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
