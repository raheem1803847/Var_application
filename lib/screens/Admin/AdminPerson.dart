import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilites/LeagueContainer.dart';
import 'package:flutter_application_1/utilites/menuBar.dart';
import 'package:flutter_application_1/screens/TableScreen.dart';

class AdminPerson extends StatefulWidget {
  @override
  _AdminPersonState createState() => _AdminPersonState();
}

class _AdminPersonState extends State<AdminPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuBar(),
      body: SafeArea(
        child: Text('')
      ),
    );
  }
}
