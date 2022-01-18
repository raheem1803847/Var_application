import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilites/menuBar.dart';
import 'package:flutter_application_1/utilites/widget.dart';

void main() => runApp(News());

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuBar(),
      body:SafeArea(
        child:Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mosalah.jpg'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.white10, BlendMode.colorDodge),
              ),
              gradient: LinearGradient(
                colors: [
                  const Color(0xffe84860),
                  const Color(0xffe70066),
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
