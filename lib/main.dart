import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Admin/functions/admin_screen.dart';
import 'package:flutter_application_1/screens/Admin/functions/components/admin_register.dart';
import 'package:flutter_application_1/screens/HomeScreen.dart';
import 'package:flutter_application_1/screens/Screen.dart';
import 'package:flutter_application_1/screens/SplashScreen.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/profile/components/body.dart';
import 'package:flutter_application_1/screens/profile/profile_screen.dart';
import 'package:flutter_application_1/screens/register.dart';
import 'package:flutter_application_1/screens/News.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        routes: {
          '/login': (context) => login(),
          '/register': (context) => register(),
          '/HomeScreen': (context) => HomeScreen(),
          '/profile_screen': (context) => ProfileScreen(),
          '/News': (context) => News(),
          '/admin_screen': (context) => admin_screen(),
          '/Screen': (context) => Screen(),
          '/admin_register': (context) => registera(),
        });
  }
}
