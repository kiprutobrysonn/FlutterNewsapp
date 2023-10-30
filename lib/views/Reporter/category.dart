import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:user_reporter/Extension/apiService.dart';

import '../../Extension/responsive.dart';

class Category1 extends StatefulWidget {
  Category1({Key? key}) : super(key: key);

  @override
  State<Category1> createState() => _Category1State();
}

class _Category1State extends State<Category1> {
  bool isloade = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  ApiService apiService = ApiService();
  List data1 = [];
  init() async {
    var resdata = await apiService.getCall('category/getCategory');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
      isloade = true;
    });
  }

  bool hovercolor = false;
  int c_index = 0;

  String? selectedValue1;
  Uint8List? webimage1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all((Responsive.isdekstop(context)) ? 20 : 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
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
                            "SR NO.",
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
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Image",
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
                            "Name",
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
                              title: Table(
                                columnWidths: {
                                  0: FlexColumnWidth(
                                      (Responsive.isdekstop(context)) ? 1 : 2),
                                  1: FlexColumnWidth(4),
                                  2: FlexColumnWidth(4),
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
                                    children: [
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${data1[index]["id"]}",
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 50,
                                            child: Image.network(
                                              // 'http://144.91.124.145/~codecha/trigger_news/' +
                                              data1[index]["image"],
                                              loadingBuilder: (BuildContext ctx,
                                                  Widget child,
                                                  ImageChunkEvent?
                                                      loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                } else {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors.green),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            "${data1[index]["catrgory_name"]}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text("No Data"),
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
