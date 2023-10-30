import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:user_reporter/Extension/extensions_export.dart';
import 'package:user_reporter/views/Reporter/reporter_user_export.dart';

class addData extends Intent {}

class SidebarXExampleApp extends StatefulWidget {
  String data;
  int d;
  SidebarXExampleApp({Key? key, required this.data, required this.d})
      : super(key: key);

  @override
  State<SidebarXExampleApp> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<SidebarXExampleApp> {
  var _controller = SidebarXController(selectedIndex: 0, extended: false);

  final _key = GlobalKey<ScaffoldState>();
  SidebarXController? _controllerr;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.numpadAdd): addData(),
      },
      child: Actions(
        actions: {
          addData: CallbackAction<addData>(
              onInvoke: (intent) => {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SidebarXExampleApp(
                    //               data: widget.data,
                    //               d: '1',
                    //             )))
                  })
        },
        child: Container(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Builder(
              builder: (context) {
                final isSmallScreen = MediaQuery.of(context).size.width < 0;
                return Scaffold(
                  key: _key,
                  drawer: ExampleSidebarX(
                    controller: _controller,
                    data: widget.data,
                  ),
                  body: Row(
                    children: [
                      if (!isSmallScreen)
                        ExampleSidebarX(
                          controller: _controller,
                          data: widget.data,
                        ),
                      Expanded(
                        child: Center(
                          child: _ScreensExample(
                            controller: _controller,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  String data;
  ExampleSidebarX(
      {Key? key, required SidebarXController controller, required this.data})
      : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: Color.fromRGBO(92, 179, 255, 1),
        itemPadding: EdgeInsets.all(5),
        textStyle: TextStyle(color: Colors.black),
        selectedTextStyle: TextStyle(
          color: Color.fromRGBO(92, 179, 255, 1),
        ),
        itemTextPadding: const EdgeInsets.only(left: 20),
        selectedItemTextPadding: const EdgeInsets.only(left: 20),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedItemDecoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 25,
        ),
        selectedIconTheme: IconThemeData(
          color: Color.fromRGBO(92, 179, 255, 1),
          size: 25,
        ),
      ),
      extendedTheme: SidebarXTheme(
        // selectedItemMargin: EdgeInsets.only(right: 30, left: 20),
        margin: EdgeInsets.all(20),
        width: (Responsive.isdekstop(context)) ? 300 : 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border(
          //   right: BorderSide(
          //     color: Colors.black54,
          //     width: 1,
          //   ),
          // ),
          color: Colors.grey[300],
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Column(
          children: [
            SizedBox(
              height: 135,
              width: 135,
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            // SizedBox(
            //   height: 80,
            //   child: Icon(
            //     Icons.person,
            //     size: 80,
            //   ),
            // ),
            // Text(
            //   data,
            //   style: TextStyle(
            //       color: Colors.green,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        );
      },
      items: const [
        SidebarXItem(
          icon: Icons.home_outlined,
          label: 'Dashboard',
        ),
        SidebarXItem(
          icon: Icons.dashboard_outlined,
          label: 'User details',
        ),
        SidebarXItem(
          icon: Icons.trending_down_rounded,
          label: 'All posts',
        ),
        SidebarXItem(
          icon: Icons.reviews_outlined,
          label: 'All categories',
        ),
        SidebarXItem(
          icon: Icons.ads_click_outlined,
          label: 'User ads',
        ),
        SidebarXItem(
          icon: Icons.notification_add_outlined,
          label: 'Notifications',
        ),
        SidebarXItem(
          icon: Icons.menu_book_outlined,
          label: 'Reporter data',
        ),
        SidebarXItem(
          icon: Icons.card_membership_outlined,
          label: 'Memebership',
        ),
        // SidebarXItem(
        //   icon: Icons.group_outlined,
        //   label: 'District',
        // ),
        // SidebarXItem(
        //   icon: Icons.group_outlined,
        //   label: 'Country',
        // ),
        // SidebarXItem(
        //   icon: Icons.group_outlined,
        //   label: 'Wallet of User',
        // ),
        // SidebarXItem(
        //   icon: Icons.group_outlined,
        //   label: 'Notification',
        // ),
        // SidebarXItem(
        //   icon: Icons.group_outlined,
        //   label: 'User Verification',
        // ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return Dashboard();
          default:
            return _getTitleByIndex(controller.selectedIndex);
        }
      },
    );
  }
}

_getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return Dashboard();
    case 1:
      return UserDetails();
    case 2:
      return Userpost(
        type: 0,
      );
    case 3:
      return Category1();
    case 4:
      return Ads();
    case 5:
      return Notification1();
    case 6:
      return UserData();
    case 7:
      return State1();
    case 8:
      return District();
    case 9:
      return Country();
    case 10:
      return wallet_history();
    case 11:
      return Notification1();
    case 12:
      return UserVerification();

    default:
      return Dashboard();
  }
}

const primaryColor = Colors.white;
const canvasColor = Colors.white;
const scaffoldBackgroundColor = Colors.green;
const accentCanvasColor = Colors.green;
const white = Color.fromARGB(255, 173, 81, 81);
final actionColor = Color.fromARGB(255, 255, 255, 255).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);









































// import 'package:deltamanager/login.dart';
// import 'package:deltamanager/splashscreen.dart';
// import 'package:deltamanager/utility/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       builder: (context, child) {
//         final mediaQueryData = MediaQuery.of(context);
//         return MediaQuery(
//           data: mediaQueryData.copyWith(textScaleFactor: 1.0),
//           child: child!,
//         );
//       },
//       title: 'Delta Manager',
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.theme(context),
//       home: Login(),
//     );
//   }
// }

// class AddIntant extends Intent {}

// class AddIntantM extends Intent {}

// class changeValue extends StatefulWidget {
//   const changeValue({super.key});

//   @override
//   State<changeValue> createState() => _changeValueState();
// }

// class _changeValueState extends State<changeValue> {
//   @override
//   Widget build(BuildContext context) {
//     int a = 0;
//     setState(() {
//       a;
//     });
//     return Scaffold(
//       body: Container(
//         child: Shortcuts(
//           shortcuts: {
//             LogicalKeySet(LogicalKeyboardKey.arrowUp): AddIntant(),
//             LogicalKeySet(LogicalKeyboardKey.arrowDown): AddIntantM(),
//           },
//           child: Actions(
//             actions: {
//               AddIntant: CallbackAction<AddIntant>(
//                   onInvoke: (intent) => {a = a + 1, print(a)}),
//               AddIntantM: CallbackAction<AddIntantM>(
//                   onInvoke: (intent) => {a = a - 1, print(a)}),
//             },
//             child: Row(
//               children: [
//                 Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: IconButton(
//                         onPressed: () {
//                           a = a + 1;
//                           print(a);
//                         },
//                         icon: Icon(Icons.add))),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(a.toString()),
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: IconButton(
//                         onPressed: () {
//                           a = a - 1;
//                           print(a);
//                         },
//                         icon: Icon(Icons.add))),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
