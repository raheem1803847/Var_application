import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilites/LeagueContainer.dart';
import 'package:flutter_application_1/utilites/menuBar.dart';

class MatchAcc extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MatchAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuBar(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(),
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Competitions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    GestureDetector(
                      child: LeagueContainer(image: ('assets/images/6.jpg')),
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/images/7.jpg'),
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/images/8.jpg'),
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/images/9.jpg'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
