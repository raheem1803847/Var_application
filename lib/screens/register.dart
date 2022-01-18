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
        body:ListView(children: [
          Container(
            child:Center(
            child: Container(
              height: 700,
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
                  
                  children:[
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('Email',style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      autofocus: false,
                      validator: validateEmail,
                      onSaved: (value) => _Username = value,
                      decoration:
                              x.copyWith(hintText: 'Email',
                    fillColor: Colors.white)
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Password',style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      autofocus: false,
                      obscureText: true,
                      validator: (value)=>value!.isEmpty?'Please enter password':null,
                      onSaved: (value) => _Password = value,
                      decoration:
                            x.copyWith(hintText: 'password',
                    fillColor: Colors.white)
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('',style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      autofocus: false,
                      obscureText: true,
                      validator: (value)=>value!.isEmpty?'Your password is required':null,
                     onSaved: (value) => _confirmPassword = value,
                      decoration:
                            x.copyWith(hintText: 'Confirm Password',
                    fillColor: Colors.white)
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    longButtons('Signup', doregister,color: Colors.black87),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              )
              ))
              ),
              
                
        ],
        addAutomaticKeepAlives: false,)
        
        );
  }

}
