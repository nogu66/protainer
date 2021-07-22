import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protainer/domain/user.dart';
import 'package:protainer/presentation/login/login_page.dart';
import 'package:protainer/presentation/signup/signup_page.dart';

import 'main.dart';

Widget DrawerMenu(BuildContext context, UserData user) {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  final length = 100.0;
  return Drawer(
    child: Container(
      child: Column(
        children: [
          user == null
              // ? UserAccountsDrawerHeader(
              //     accountName: null,
              //     accountEmail: null,
              //     currentAccountPicture: CircleAvatar(
              //       backgroundColor: Colors.white,
              //       backgroundImage: NetworkImage(
              //           "https://vetcentre.com.au/wp-content/uploads/2019/11/blank-profile-picture-973460_640.png"),
              //     ),
              //   )
              ? Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  child: DrawerHeader(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Text('新規登録'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                          // style: ElevatedButton.styleFrom(
                          //   primary: Colors.white,
                          // ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                          child: ElevatedButton(
                            child: Text('ログイン'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            // style: ElevatedButton.styleFrom(
                            //   primary: Colors.white,
                            // ),
                          ),
                        ),
                      ],
                    ),
                    // decoration: BoxDecoration(
                    //   color: Colors.yellow,
                    // ),
                  ),
                )
              : Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      child: DrawerHeader(
                        child: Column(
                          children: [
                            Container(
                              width: length,
                              height: length,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(user.imageURL),
                                ),
                              ),
                              // child: Image.network(user.imageURL),
                            ),
                            Text(user.name),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: InkWell(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0, 16.0, 0),
                              child: Icon(Icons.logout),
                            ),
                            Text('ログアウト'),
                          ],
                        ),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          await Future.delayed(
                              const Duration(milliseconds: 300));
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MyHomePage();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ],
      ),
    ),
  );
}
