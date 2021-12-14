import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key}) : super(key: key);

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
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.person_outlined,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/profile_screen');
                },
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
