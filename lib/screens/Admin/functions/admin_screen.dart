import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilites/menuBar.dart';
import 'components/functions.dart';

class admin_screen extends StatelessWidget {
  static String routeName = "/Admin";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuBar(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: adminBody(),
    );
  }
}
