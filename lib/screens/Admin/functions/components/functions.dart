import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'admin_menu.dart';
const String _url = 'https://console.firebase.google.com/project/var-application/authentication/users';
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
            icon: "assets/icons/Lock.svg",
            press: (_launchURL),
          ),
          adminMenu(
            text: "username",
            icon: "assets/icons/Lock.svg",
            press: () {},
          ),
          adminMenu(
            text: "Password",
            icon: "assets/icons/Lock.svg",
            press: () {},
          ),
          adminMenu(
            text: "Log Out",
            icon: "assets/icons/Lock.svg",
            press: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
void _launchURL() async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}