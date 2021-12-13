import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilites/validator.dart';
import 'package:flutter_application_1/utilites/widget.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String? _Username;
  String? _Password;
  @override
  Widget build(BuildContext context) {
    var dologin = () {  
         Navigator.pushReplacementNamed(context, '/HomeScreen'); 
    }
    ;
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
          child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
      ],
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('login'),
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
                child: Column(
                  children: [
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
                    longButtons('Login', dologin),
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