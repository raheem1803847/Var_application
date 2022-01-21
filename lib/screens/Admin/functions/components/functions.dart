import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'admin_menu.dart';

class adminBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          adminMenu(
            text: "View Users",
            icon: "",
            press: () async {
              final Url =
                  'https://console.firebase.google.com/project/var-application/authentication/users';
              if (await canLaunch(Url)) 
              {
                await launch(Url);
              }
            },
          ),
          adminMenu(
            text: "username",
            icon: "assets/icons/User Icon.svg",
            press: () {},
          ),
          adminMenu(
            text: "Password",
            icon: "assets/icons/Lock.svg",
            press: () {},
          ),
          adminMenu(
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
