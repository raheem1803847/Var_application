import 'package:firebase_auth/firebase_auth.dart';
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
            text: "username",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
              text: "Email",
              icon: "assets/icons/Mail.svg",
              press: () {
                var currentUser = FirebaseAuth.instance.currentUser;

                if (currentUser != null) 
                {
                  text:
                  currentUser.email;
                }
              }),
          ProfileMenu(
            text: "Password",
            icon: "assets/icons/Lock.svg",
            press: () {},
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
