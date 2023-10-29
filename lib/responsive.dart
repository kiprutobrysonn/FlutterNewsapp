import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget dekstop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.dekstop,
  }) : super(key: key);

  static bool ismobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool istable(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isdekstop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth <= 650) {
          return mobile;
        } else if (constraints.minWidth <= 1100) {
          return tablet;
        } else {
          return dekstop;
        }
      },
    );
  }
}
