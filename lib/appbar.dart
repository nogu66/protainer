import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protainer/domain/user.dart';
import 'package:protainer/presentation/profile/profile_page.dart';

import 'main.dart';

Widget appbar(BuildContext context, UserData user,
    GlobalKey<ScaffoldState> _scaffoldKey) {
  const radius = 45.0;
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.yellow,
    ),
    backgroundColor: Colors.black,
    automaticallyImplyLeading: false,
    title: const Text(
      'Protainer',
      style: TextStyle(
        fontSize: 30,
        color: Colors.yellow,
      ),
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.menu,
        color: Colors.yellow,
      ),
      onPressed: () {
        _scaffoldKey.currentState.openDrawer();
      },
      // onPressed: () => Scaffold.of(context).openDrawer(),
    ),
    actions: [
      user == null
          ? Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 16.0, 0),
              child: Container(
                width: radius,
                height: radius,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://vetcentre.com.au/wp-content/uploads/2019/11/blank-profile-picture-973460_640.png")),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 16.0, 0),
              child: InkWell(
                child: Container(
                  width: radius,
                  height: radius,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(user.imageURL),
                    ),
                  ),
                ),
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
              ),
            ),
    ],
  );
}
