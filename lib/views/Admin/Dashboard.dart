import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:user_reporter/Extension/apiService.dart';
import 'package:user_reporter/views/Admin/admin_export.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ApiService apiService = ApiService();
  bool isloade = false;
  bool isloade1 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    init1();
  }

  List data1 = [];
  init() async {
    var resdata = await apiService.getCall('state/getstate');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
      isloade = true;
    });
  }

  List data2 = [];
  init1() async {
    var resdata = await apiService.getCall('category/getCategory');
    log("${resdata}");
    setState(() {
      data2 = resdata['data'];
      isloade1 = true;
    });
  }

  // SideTitles get _bottomTitles => SideTitles(
  //       showTitles: true,
  //       getTitlesWidget: (value, meta) {
  //         String text = '';
  //         switch (value.toInt()) {
  //           case 1:
  //             text = ' Monday';
  //             break;
  //           case 3:
  //             text = 'Tuesday';
  //             break;
  //           case 5:
  //             text = 'Wednesday';
  //             break;
  //           case 7:
  //             text = 'Thursday';
  //             break;
  //           case 9:
  //             text = 'Friday';
  //             break;
  //           case 11:
  //             text = 'Saturday';
  //             break;
  //           case 13:
  //             text = 'Sunday';
  //             break;
  //         }

  //         return Text(text);
  //       },
  //     );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dashboard",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Hi,Welcome back to Business Store",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         "Filter Order",
                    //         style: TextStyle(
                    //           color: Colors.black,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //       Text(
                    //         "17 April 2023 - 21 May 2023",
                    //         style: TextStyle(
                    //           color: Colors.black,
                    //           fontSize: 10,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    // ignore: unused_local_variable
                    for (var item in [1, 2, 3, 4, 5])
                      Stack(
                        children: [
                          Container(
                            width: 200,
                            padding:
                                EdgeInsets.only(top: 60, left: 30, bottom: 20),
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(80),
                                topLeft: Radius.circular(18),
                                bottomLeft: Radius.circular(18),
                                bottomRight: Radius.circular(18),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: Offset(
                                    2.0,
                                    2.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                              color: Colors.grey[100],
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "75",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Response",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromRGBO(0, 138, 176, 0.098),
                                      ),
                                      child: Icon(
                                        Icons.arrow_upward,
                                        color: Colors.blue.shade400,
                                        size: 10,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "4% (30 days)",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 10,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(228, 241, 246, 1),
                              ),
                              child: Icon(
                                Icons.auto_graph_rounded,
                                size: 40,
                                color: Colors.blue.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                Wrap(
                  children: [
                    Container(
                      margin: EdgeInsets.all(18),
                      padding: EdgeInsets.all(10),
                      height: 300,
                      width: 600,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(
                              2.0,
                              2.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Visitor",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 45),
                              height: 190,
                              child: LineChart(
                                LineChartData(
                                  borderData: FlBorderData(show: false),
                                  minX: 0,
                                  maxX: 15,
                                  minY: 0,
                                  maxY: 15,
                                  // backgroundColor: Colors.white,
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: [
                                        const FlSpot(0, 5),
                                        const FlSpot(1, 4),
                                        const FlSpot(2, 1),
                                        const FlSpot(3, 15),
                                        const FlSpot(4, 6),
                                        const FlSpot(5, 2),
                                        const FlSpot(6, 5),
                                        const FlSpot(7, 1),
                                        const FlSpot(8, 6),
                                        const FlSpot(9, 10),
                                        const FlSpot(10, 5),
                                        const FlSpot(12, 10),
                                        const FlSpot(13, 12),
                                        const FlSpot(14, 1),
                                        const FlSpot(15, 10),
                                      ],
                                      barWidth: 3,
                                      belowBarData: BarAreaData(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.white.withOpacity(0.2),
                                            Colors.blue.shade400,
                                          ],
                                        ),
                                        show: true,
                                      ),
                                      dotData: FlDotData(
                                        show: false,
                                      ),
                                      isCurved: true,
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.blue,
                                          Colors.blue,
                                        ],
                                      ),
                                    ),
                                  ],
                                  gridData: FlGridData(
                                    show: false,
                                    drawHorizontalLine: false,
                                    drawVerticalLine: true,
                                    getDrawingVerticalLine: (valu1) {
                                      return FlLine(
                                        color: Colors.grey.shade800,
                                        strokeWidth: 100,
                                      );
                                    },
                                  ),
                                  titlesData: FlTitlesData(
                                    bottomTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    leftTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    topTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    rightTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Monday",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Tuesday",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Wednesday",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Thursday",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Friday",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Saturday",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Sunday",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(18),
                      padding: EdgeInsets.all(10),
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(
                              2.0,
                              2.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Wallet History",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "View all",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.orange),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 200,
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Color.fromRGBO(
                                                0, 79, 176, 0.094),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.blue.shade400,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.arrow_drop_up,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Orders",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                "Apr 27,2022",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "+\$874",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(0, 176, 116, 1),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Color.fromRGBO(
                                                0, 79, 176, 0.094),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.blue.shade400,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Orders",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                "Apr 27,2022",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "+\$874",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(18),
                      // padding: EdgeInsets.all(10),
                      height: 300,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(
                              2.0,
                              2.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Category",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Home_admin_admin(i: 6),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "View all",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.orange),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 9, right: 9),
                            child: Table(
                              columnWidths: {
                                0: FlexColumnWidth(4),
                                1: FlexColumnWidth(4),
                                2: FlexColumnWidth(1),
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
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  children: [
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          "Image",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          "Name",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: (isloade1 == true)
                                ? (data2.isEmpty || data2 == Null)
                                    ? Center(
                                        child: Text("No Data"),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
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
                                          itemCount: data2.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              contentPadding: EdgeInsets.all(0),
                                              minVerticalPadding: 0,
                                              title: Table(
                                                columnWidths: {
                                                  0: FlexColumnWidth(4),
                                                  1: FlexColumnWidth(4),
                                                  2: FlexColumnWidth(1),
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
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            height: 50,
                                                            width: 200,
                                                            child:
                                                                Image.network(
                                                              // 'http://144.91.124.145/~codecha/trigger_news/' +
                                                              data2[index]
                                                                  ["image"],
                                                              fit: BoxFit.fill,
                                                              loadingBuilder:
                                                                  (BuildContext
                                                                          ctx,
                                                                      Widget
                                                                          child,
                                                                      ImageChunkEvent?
                                                                          loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return child;
                                                                } else {
                                                                  return const Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor: AlwaysStoppedAnimation<
                                                                              Color>(
                                                                          Colors
                                                                              .green),
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
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          child: Text(
                                                            "${data2[index]["catrgory_name"]}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 17,
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
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(18),
                      // padding: EdgeInsets.all(10),
                      height: 300,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(
                              2.0,
                              2.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "State",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Home_admin_admin(i: 7),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "View all",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.orange),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 9, right: 9),
                            child: Table(
                              columnWidths: {
                                0: FlexColumnWidth(4),
                                1: FlexColumnWidth(4),
                                2: FlexColumnWidth(1),
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
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  children: [
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          "Image",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          "Name",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: (isloade == true)
                                ? (data1.isEmpty || data1 == Null)
                                    ? Center(
                                        child: Text("No Data"),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
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
                                                  0: FlexColumnWidth(4),
                                                  1: FlexColumnWidth(4),
                                                  2: FlexColumnWidth(1),
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
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            height: 50,
                                                            width: 200,
                                                            child:
                                                                Image.network(
                                                              // 'http://144.91.124.145/~codecha/trigger_news/' +
                                                              data1[index]
                                                                  ["image"],
                                                              fit: BoxFit.fill,
                                                              loadingBuilder:
                                                                  (BuildContext
                                                                          ctx,
                                                                      Widget
                                                                          child,
                                                                      ImageChunkEvent?
                                                                          loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return child;
                                                                } else {
                                                                  return const Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor: AlwaysStoppedAnimation<
                                                                              Color>(
                                                                          Colors
                                                                              .green),
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
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          child: Text(
                                                            "${data1[index]["name"]}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 17,
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
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Container(
                //   margin: EdgeInsets.all(18),
                //   // height: 400,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.shade300,
                //         offset: Offset(
                //           2.0,
                //           2.0,
                //         ),
                //         blurRadius: 10.0,
                //         spreadRadius: 2.0,
                //       ),
                //     ],
                //     color: Colors.grey[100],
                //     border: Border.all(
                //       color: Colors.white,
                //     ),
                //   ),
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           Container(
                //             padding: EdgeInsets.only(
                //                 left: 50, top: 10, bottom: 20),
                //             child: Text(
                //               "Userlog",
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 22,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       Table(
                //         // columnWidths: {
                //         //   0: FixedColumnWidth(100.0),
                //         //   1: FlexColumnWidth(5),
                //         //   2: FixedColumnWidth(200),
                //         //   3: FixedColumnWidth(100.0),
                //         //   4: FlexColumnWidth(5),
                //         //   5: FixedColumnWidth(100.0),
                //         //   6: FixedColumnWidth(100.0),
                //         // },
                //         children: [
                //           TableRow(
                //             children: [
                //               Text(
                //                 "User",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               Text(
                //                 "Email",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               Text(
                //                 "Last Login At",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               Text(
                //                 "IP",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               Text(
                //                 "Country",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               Text(
                //                 "OS Name",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               Text(
                //                 "Device Name",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ],
                //           ),
                //           for (var item in [1, 2, 3])
                //             TableRow(
                //               children: [
                //                 Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.center,
                //                   children: [
                //                     ClipRect(
                //                       child: Container(
                //                         child: Align(
                //                           alignment:
                //                               Alignment.center,
                //                           widthFactor: 2,
                //                           heightFactor: 2,
                //                           child: Image.network(
                //                             'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80',
                //                             width: 40,
                //                             height: 40,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     Text(
                //                       "Cara Shirt",
                //                       style: TextStyle(
                //                         fontWeight:
                //                             FontWeight.w600,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 Padding(
                //                   padding:
                //                       const EdgeInsets.all(30),
                //                   child: Text(
                //                     "manager101@gmail.com",
                //                     textAlign: TextAlign.center,
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding:
                //                       const EdgeInsets.all(30),
                //                   child: Text(
                //                     "17/04/2023",
                //                     textAlign: TextAlign.center,
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding:
                //                       const EdgeInsets.all(30),
                //                   child: Text(
                //                     "195.345.0.1",
                //                     textAlign: TextAlign.center,
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding:
                //                       const EdgeInsets.all(30),
                //                   child: Text(
                //                     "Germany",
                //                     textAlign: TextAlign.center,
                //                     style: TextStyle(
                //                         color: Color.fromRGBO(
                //                             0, 176, 116, 1)),
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding:
                //                       const EdgeInsets.all(30),
                //                   child: Text(
                //                     "Windows",
                //                     textAlign: TextAlign.center,
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding:
                //                       const EdgeInsets.all(30),
                //                   child: Text(
                //                     "Desktop",
                //                     textAlign: TextAlign.center,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            // Container(
            //   margin: EdgeInsets.only(left: 10),
            //   child: Text(
            //     "Customer Review",
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
            //     Wrap(
            //       children: [
            //         for (var item in [1, 2, 3, 4, 5])
            //           Container(
            //             width: 250,
            //             padding: EdgeInsets.all(20),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.shade300,
            //                   offset: Offset(
            //                     2.0,
            //                     2.0,
            //                   ),
            //                   blurRadius: 10.0,
            //                   spreadRadius: 2.0,
            //                 ),
            //               ],
            //               color: Colors.grey[100],
            //               border: Border.all(
            //                 color: Colors.white,
            //               ),
            //             ),
            //             margin: EdgeInsets.all(10),
            //             child: Column(
            //               crossAxisAlignment:
            //                   CrossAxisAlignment.start,
            //               children: [
            //                 Row(
            //                   children: [
            //                     Container(
            //                       height: 50,
            //                       width: 50,
            //                       child: CircleAvatar(
            //                         radius: 48, // Image radius
            //                         backgroundImage: NetworkImage(
            //                             'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       width: 15,
            //                     ),
            //                     Column(
            //                       crossAxisAlignment:
            //                           CrossAxisAlignment.start,
            //                       children: [
            //                         Text(
            //                           "Jons Sena",
            //                           style: TextStyle(
            //                             color: Colors.black,
            //                             fontWeight:
            //                                 FontWeight.w500,
            //                             fontSize: 20,
            //                           ),
            //                         ),
            //                         Text(
            //                           "2 days ago",
            //                           style: TextStyle(
            //                             color: Colors.grey,
            //                             fontWeight:
            //                                 FontWeight.w500,
            //                             fontSize: 15,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Container(
            //                   width: 200,
            //                   child: Text(
            //                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            //                     overflow: TextOverflow.ellipsis,
            //                     maxLines: 5,
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //               ],
            //             ),
            //           ),
            //       ],
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }

  get_box() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          padding: EdgeInsets.only(top: 60, left: 30, bottom: 20),
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(80),
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
            color: Colors.grey[100],
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "75",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Total Sales",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(0, 176, 116, 0.1),
                    ),
                    child: Icon(
                      Icons.arrow_upward,
                      color: Color.fromRGBO(0, 176, 116, 1),
                      size: 10,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "4% (30 days)",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 50,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(228, 246, 240, 1),
            ),
            child: Icon(
              Icons.auto_graph_rounded,
              size: 40,
              color: Color.fromRGBO(0, 176, 116, 1),
            ),
          ),
        ),
      ],
    );
  }
}
