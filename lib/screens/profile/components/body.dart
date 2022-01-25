import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Email",
            icon: "assets/icons/Mail.svg",
            press: () {
              var currentUser = FirebaseAuth.instance.currentUser;
              if (currentUser != null) {
                text:
                currentUser.email;
              }
              showDialog(
                  context: context,
                  builder: (BuildContext context) => new CupertinoAlertDialog(
                        title: Text("your Email is ${currentUser!.email} "),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/profile_screen');
                            },
                            child: Text("ok"),
                          )
                        ],
                      ));
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
