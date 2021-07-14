import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protainer/presentation/profile/profile_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Protainer',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Consumer<ProfileModel>(builder: (context, model, child) {
          final user = model.user;
          return Center(
            child: Column(
              children: [
                // Image.network(
                //   user.imageURL,
                //   width: 50,
                // ),
                // Text(user.name),
                // Text(user.introduction),
              ],
            ),
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
      ),
    );
  }
}
