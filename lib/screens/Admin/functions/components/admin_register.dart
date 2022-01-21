// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilites/validator.dart';
import 'package:flutter_application_1/utilites/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class registera extends StatefulWidget {
  registera({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<registera> {
  final formkey = GlobalKey<FormState>();
  String _Username = '';
  String _Password = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_function_declarations_over_variables
    var doregister = () {
      final form = formkey.currentState;
      if (form!.validate()) {
        auth.createUserWithEmailAndPassword(
            email: _Username, password: _Password);
        Navigator.pushReplacementNamed(context, '/admin_screen');
      }
    };
    return Scaffold(
        body: ListView(
      children: [
        Container(
            child: Center(
                child: Container(
                    height: 700,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                    ),
                    padding: EdgeInsets.all(40.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('Email', style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                              autofocus: false,
                              validator: validateEmail,
                              onChanged: (value) => _Username = value,
                              decoration: x.copyWith(
                                  hintText: 'Email', fillColor: Colors.white)),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('Password',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                              autofocus: false,
                              obscureText: true,
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter password'
                                  : null,
                              onChanged: (value) => _Password = value,
                              decoration: x.copyWith(
                                  hintText: 'password',
                                  fillColor: Colors.white)),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('', style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 5.0,
                          ),
                          longButtons('Add user', doregister,
                              color: Colors.black87),
                          SizedBox(
                            height: 8.0,
                          ),
                        ],
                      ),
                    )))),
      ],
      addAutomaticKeepAlives: false,
    ));
  }
}
