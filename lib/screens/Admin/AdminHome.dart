import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/components/body.dart';
import 'package:flutter_application_1/screens/profile/components/profile_pic.dart';
import 'package:flutter_application_1/screens/profile/components/profile_menu.dart';
import 'package:flutter_application_1/utilites/menuBarAdmin.dart';

class Admin extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuBarAdmin(),
      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        
        title: Text(
          "Hello Admin_name",
          style: TextStyle(color: Colors.black),
        ),
      ),
      
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,

        
        children: <Widget>[
          ProfilePic(),
          SizedBox(height: 60),

          SizedBox(
            width: double.infinity,
          ),
          
          ProfileMenu(
            text: "news",
            icon: "assets/icons/news.svg",
            press: () => {
              Navigator.pushNamed(context,'/news')
            },
          ),

          ProfileMenu(
            text: "matches",
            icon: "assets/icons/soccor.svg",
            press: () => {
              Navigator.pushNamed(context,'/news')
            },
          ),

          ProfileMenu(
            text: "Admins",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.pushNamed(context,'/news')
            },
          ),

          
          
        ],
      ),
    );
  }
}
