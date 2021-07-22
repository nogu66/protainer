import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protainer/main.dart';
import 'package:protainer/presentation/set_profile/set_profile_model.dart';
import 'package:provider/provider.dart';

class SetProfilePage extends StatelessWidget {
  SetProfilePage({this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final introductionController = TextEditingController();
    return ChangeNotifierProvider<SetProfileModel>(
      create: (_) => SetProfileModel(),
      child: Scaffold(
        body: Consumer<SetProfileModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(hintText: '名前'),
                      controller: nameController,
                      onChanged: (text) {
                        model.name = text;
                      },
                    ),
                    ElevatedButton(
                      child: Text('設定'),
                      onPressed: () async {
                        try {
                          await model.setProfile(uid);
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('登録完了しました'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MyHomePage(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              });
                        } catch (e) {
                          _showDialog(context, e.toString());
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }),
        // bottomNavigationBar: ,
      ),
    );
  }

  Future _showDialog(
    BuildContext context,
    String title,
  ) {
    return showDialog(
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
        });
  }
}
