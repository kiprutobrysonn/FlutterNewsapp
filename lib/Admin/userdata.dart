import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:user_reporter/Admin/home.dart';
import 'package:user_reporter/apiService.dart';
import 'package:user_reporter/responsive.dart';

class UserData extends StatefulWidget {
  UserData({Key? key}) : super(key: key);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  ApiService apiService = ApiService();
  var userid;
  bool isloade = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  List data1 = [];
  init() async {
    var resdata = await apiService.getCall('user/getalluser');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
      isloade = true;
    });
  }

  bool hovercolor = false;
  int c_index = 0;

  String? selectedValue1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all((Responsive.isdekstop(context)) ? 20 : 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "User Data",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: EdgeInsets.only(
                left: (Responsive.isdekstop(context)) ? 10 : 0,
                right: (Responsive.isdekstop(context)) ? 10 : 0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth((Responsive.isdekstop(context)) ? 1 : 2),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(4),
                  3: FlexColumnWidth((Responsive.isdekstop(context)) ? 2 : 4),
                },
                border: TableBorder.symmetric(
                  inside: BorderSide(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                ),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "SR No.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "User Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Total Post",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "view",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: 1,
          // ),
          Expanded(
            flex: 1,
            child: (isloade == true)
                ? (data1.isNotEmpty)
                    ? Container(
                        margin: EdgeInsets.only(
                          left: (Responsive.isdekstop(context)) ? 10 : 0,
                          right: (Responsive.isdekstop(context)) ? 10 : 0,
                        ),
                        decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: Colors.black.withOpacity(0.05),
                          //       spreadRadius: 2,
                          //       blurRadius: 5,
                          //       offset: Offset(0, 3)),
                          // ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: data1.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.all(0),
                              minVerticalPadding: 0,
                              title: MouseRegion(
                                onEnter: (event) {
                                  hovercolor = true;
                                  c_index = index;
                                  print(c_index);
                                  setState(() {});
                                },
                                onExit: (event) {
                                  hovercolor = false;
                                  setState(() {});
                                },
                                child: Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(
                                        (Responsive.isdekstop(context))
                                            ? 1
                                            : 2),
                                    1: FlexColumnWidth(4),
                                    2: FlexColumnWidth(4),
                                    3: FlexColumnWidth(
                                        (Responsive.isdekstop(context))
                                            ? 2
                                            : 4),
                                  },
                                  border: TableBorder.symmetric(
                                    inside: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 1,
                                    ),
                                    outside: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  children: [
                                    TableRow(
                                      decoration: BoxDecoration(
                                        color: (c_index == index)
                                            ? (hovercolor)
                                                ? Colors.grey.shade200
                                                : Colors.white
                                            : Colors.white,
                                      ),
                                      children: [
                                        TableCell(
                                          verticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${index + 1}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          verticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  minRadius:
                                                      Responsive.ismobile(
                                                              context)
                                                          ? 15
                                                          : null,
                                                  backgroundImage: AssetImage(
                                                      'assets/man.png'),
                                                ),
                                                SizedBox(
                                                  width: (Responsive.ismobile(
                                                          context))
                                                      ? 5
                                                      : 20,
                                                ),
                                                Text(
                                                  "${data1[index]["username"]}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          verticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${data1[index]["totalpost"]}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          verticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: OutlinedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors.blue),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              // Userpost(
                                                              //     type: 1,
                                                              //     userid:
                                                              //         "${data1[index]["id"]}"),
                                                              Home_admin_admin(),
                                                        ),
                                                      );
                                                    },
                                                    child: const Text(
                                                      "View",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : SizedBox(
                        child: Center(
                          child: Text("No Data"),
                        ),
                      )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    ));
  }
}
