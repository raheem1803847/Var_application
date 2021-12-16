import 'package:flutter/material.dart';

class MenuBarAdmin extends StatelessWidget {
  const MenuBarAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home_outlined,
                ),
                onPressed: () {Navigator.pushReplacementNamed(context, '/AdminHome');},
              ),
              
              IconButton(
                icon: Icon(
                  Icons.person_outlined,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/AdminPerson');
                },
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
