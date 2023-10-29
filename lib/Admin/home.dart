import 'package:flutter/material.dart';
import 'package:user_reporter/Admin/drawer.dart';

// ignore: must_be_immutable
class Home_admin_admin extends StatefulWidget {
  int? i;
  Home_admin_admin({super.key, this.i});

  @override
  State<Home_admin_admin> createState() => _Home_admin_adminState();
}

class _Home_admin_adminState extends State<Home_admin_admin> {
  String code = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.i != null) {
      print(widget.i!);
    }
  }

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
                i: (widget.i != null) ? widget.i! : 0,
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
