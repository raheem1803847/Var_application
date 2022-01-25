import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/register.dart';
import 'package:flutter_application_1/utilites/validator.dart';
import 'package:flutter_application_1/utilites/widget.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final formkey = GlobalKey<FormState>();
  String _Username = '';
  String _Password = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_function_declarations_over_variables
    var dologin = () async {
      final form = formkey.currentState;
      if (form!.validate()) {
        try {
          UserCredential result = await auth.signInWithEmailAndPassword(
              email: _Username, password: _Password);
          User? user = result.user;
          Navigator.pushReplacementNamed(context, '/HomeScreen');
          if (_Username == "admin@gmail.com" && _Password == "admin1234") {
            Navigator.pushReplacementNamed(context, '/admin_screen');
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
           showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
              title: Text("User not found"),
              content: Text("Please Sign up "),
              actions:[
               FlatButton( onPressed: () { 
                  Navigator.pushReplacementNamed(context, '/register');
                },
               child: Text("ok"),)

              ],
           ));
          } else if (e.code == 'wrong-password') {
                showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
              title: Text("Wrong Password"),
              content: Text("Please Re-enter your password  "),
             actions:[
               FlatButton( onPressed: () { 
                  Navigator.pushReplacementNamed(context, '/login');
                },
               child: Text("ok"),)

              ],
                ));
          }
        }
      }
    };
    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.all(0.0),
          child: Text("Forgot password?",
              style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
//            Navigator.pushReplacementNamed(context, '/reset-password');
          },
        ),
        FlatButton(
          padding: EdgeInsets.only(left: 0.0),
          child: Text("Sign up",
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
      ],
    );
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: 800,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/ixpap-5.jpg'),
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Colors.white60, BlendMode.colorDodge),
            ),
          ),
          padding: EdgeInsets.all(50.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Email',
                  style: TextStyle(color: Colors.white10),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                    autofocus: false,
                    validator: validateEmail,
                    onChanged: (value) => _Username = value,
                    decoration:
                        x.copyWith(hintText: 'Email', fillColor: Colors.white)),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Password',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                    autofocus: false,
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter password' : null,
                    onChanged: (value) => _Password = value,
                    decoration: x.copyWith(
                        hintText: 'password', fillColor: Colors.white)),
                SizedBox(
                  height: 20.0,
                ),
                longButtons('Login', dologin, color: Colors.black87),
                SizedBox(
                  height: 8.0,
                ),
                forgotLabel
              ],
            ),
          )),
    ));
  }
}
