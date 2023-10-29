import 'package:flutter/material.dart';
import 'package:user_reporter/drawer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SidebarXExampleApp(
                data: code.toString(),
                d: 1,
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
