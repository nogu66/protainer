import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            backgroundColor: Colors.yellow,
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
              model.getTextCounter();
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 16.0),
                  child: Container(
                    color: Colors.white,
                    height: model.imageFile != null ? 600 : 400,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                                child: TextField(
                                  maxLines: 7,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(140),
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "${140 - model.textCounter}",
                                  ),
                                  controller: textEditingController,
                                  onChanged: (text) {
                                    model.body = text;
                                    model.textCounter = text.length;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              final pickedFile = await picker.pickImage(
                                source: ImageSource.gallery,
                              );
                              model.setImage(File(pickedFile.path));
                            },
                            child: model.imageFile != null
                                ? SizedBox(
                                    width: 120,
                                    height: 160,
                                    child: Image.file(model.imageFile))
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.image,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            ' 画像',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.yellow),
                            child: Text(
                              '投稿',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () async {
                              model.startLoading();
                              await addPost(model, context);
                              model.endLoading();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
