import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import 'package:flutter_application_1/screens/MatchScreen.dart';
import 'package:flutter_application_1/screens/Matchacc.dart';
import 'package:flutter_application_1/screens/SplashScreen.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      
     home: SplashScreen(),

      routes:
      {
        '/login':(context)=>login(),
        '/register':(context)=>register(),
        '/HomeScreen':(context)=>HomeScreen(),
      }
      
    );
  }
}




  
