import 'package:flutter/material.dart';

class Wallet_User extends StatefulWidget {
  Wallet_User({Key? key}) : super(key: key);

  @override
  State<Wallet_User> createState() => _Wallet_UserState();
}

class _Wallet_UserState extends State<Wallet_User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Wallet Of User",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
