import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:user_reporter/Extension/extensions_export.dart';

class Userpost extends StatefulWidget {
  Userpost({Key? key, required int type}) : super(key: key);

  @override
  State<Userpost> createState() => _UserpostState();
}

class _UserpostState extends State<Userpost> {
  String select_category = "1";

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  ApiService apiService = ApiService();

  var userid;
  bool isloade = false;
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    getposts();
  }

  List data1 = [];
  List data2 = [];
  init() async {
    var resdata = await apiService.getCall('category/getCategory');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
    });
  }

  getposts() async {
    var resdata1 = select_category == "1"
        ? await apiService.getCall('news/getnews?type_category=1')
        : await apiService
            .getCall('news/getnews?type_category=${select_category}');
    log("${resdata1}");
    setState(() {
      data2 = resdata1['data'];
      isloade = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "User Post",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: select_category,
                      onChanged: (String? value) {
                        setState(() {
                          select_category = value!;
                          getposts();
                          isloade = false;
                          log("${select_category}");
                        });
                      },
                      items: [
                        for (var data in data1)
                          DropdownMenuItem<String>(
                            value: '${data['id']}',
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${data['catrgory_name']}",
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
                child: (isloade == true)
                    ? (data2.isNotEmpty)
                        ? ListView(
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  for (var item in data2)
                                    Container(
                                      width: 200,
                                      height: 200,
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              blurRadius: 5.0,
                                              offset: Offset(0.2, 3.0),
                                            ),
                                          ],
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'http://144.91.124.145/~codecha/trigger_news/' +
                                                  item["image"],
                                              fit: BoxFit.cover,
                                              width: 200,
                                              height: 130,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  textScaleFactor: 1.0,
                                                  "${item["headline"]}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      textScaleFactor: 1.0,
                                                      "${item["username"]}",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .grey.shade400,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          textScaleFactor: 1.0,
                                                          "${item["time"]} hours ago",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          )
                        : Center(
                            child: Text("No Data"),
                          )
                    : Center(
                        child: CircularProgressIndicator(),
                      )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
