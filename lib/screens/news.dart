import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilites/menuBar.dart';
import 'package:flutter_application_1/utilites/widget.dart';
import 'package:flutter_application_1/screens/TableScreen.dart';
import 'package:flutter_application_1/utilites/menuBar.dart';
import 'package:get/get.dart';
  

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuBar(),
      body:SafeArea(
        child:Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              
              gradient: LinearGradient(
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  const Color(0x000000),
                  const Color(0xFFFF9100),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                NewsWidget(),
                spaceNewsWidget(),
                NewsWidget(),
                spaceNewsWidget(),
                NewsWidget(),
              ],
            )
              ),
              
        ), 
        ) 
      
    );

  }
}
