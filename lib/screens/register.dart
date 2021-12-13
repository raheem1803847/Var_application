// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilites/validator.dart';
import 'package:flutter_application_1/utilites/widget.dart';

class register extends StatefulWidget {
  register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final formkey = GlobalKey<FormState>();
  String? _Username;
  String? _Password;
   String? _confirmPassword;
  String? _Name;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_function_declarations_over_variables
    var doregister = () {
      final form = formkey.currentState;
      if (form!.validate()) {
        form.save();
        Navigator.pushReplacementNamed(context, '/login');
      }
       
    };
    return Scaffold(
        appBar: AppBar(
          title: Text('Regesteration'),
        ),
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
              padding: EdgeInsets.all(40.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Name'),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      autofocus: false,
                      obscureText: true,
                      validator: (value)=>value!.isEmpty? 'please enter your Name' : null,
                       onSaved: (value) => _Name ,
                      decoration: buildInputDecoration2(''),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('Email'),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      autofocus: false,
                      validator: validateEmail,
                      onSaved: (value) => _Username = value,
                      decoration:
                          buildInputDecoration('Enter Email', Icons.email),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Password'),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      autofocus: false,
                      obscureText: true,
                      validator: (value)=>value!.isEmpty?'Please enter password':null,
                      onSaved: (value) => _Password = value,
                      decoration:
                          buildInputDecoration('Enter password', Icons.lock),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(''),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      autofocus: false,
                      obscureText: true,
                      validator: (value)=>value!.isEmpty?'Your password is required':null,
                     onSaved: (value) => _confirmPassword = value,
                      decoration:
                          buildInputDecoration('Confirm password', Icons.lock),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    longButtons('Signup', doregister),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              )),
        ));
  }

}
