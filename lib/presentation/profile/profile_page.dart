import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protainer/footer.dart';
import 'package:protainer/presentation/login/login_page.dart';
import 'package:protainer/presentation/profile/profile_model.dart';
import 'package:protainer/presentation/signup/signup_page.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class ProfilePage extends StatelessWidget {
  final radius = 100.0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel()..getUserProfile(),
      child: Consumer<ProfileModel>(
        builder: (context, model, child) {
          final user = model.user;
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.yellow,
              ),
              backgroundColor: Colors.black,
              title: Text(
                'マイページ',
                style: TextStyle(
                  color: Colors.yellow,
                ),
              ),
            ),
            body: user == null
                ? Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()),
                            );
                          },
                          child: Text('新規登録'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text('ログイン'),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: radius,
                                height: radius,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(user.imageURL),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '名前:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          user.name,
                                          style: TextStyle(
                                              // fontSize: 30,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
            // bottomNavigationBar: Footer(context, model),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(
      //     Icons.note_add,
      //     color: Colors.black,
      //   ),
      //   // backgroundColor: Colors.yellow,
      // ),
      // bottomNavigationBar: ,
    );
  }
}
