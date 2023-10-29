import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:user_reporter/apiService.dart';
import 'package:user_reporter/responsive.dart';

class Userpost extends StatefulWidget {
  Userpost({Key? key, required this.type, this.userid}) : super(key: key);
  final type;
  final userid;
  @override
  State<Userpost> createState() => _UserpostState();
}

class _UserpostState extends State<Userpost> {
  String dropdownvalue = "1";

  // List of items in our dropdown menu

  ApiService apiService = ApiService();

  bool temp = false;
  int c_index = 1;
  String c_int = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    init1(int.parse(dropdownvalue));
  }

  List data1 = [];
  List data2 = [];

  init() async {
    var resdata = await apiService.getCall('category/getCategory');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
      print(data1);
    });
  }

  init1(int index) async {
    var resdata;
    widget.type == 0
        ? resdata =
            await apiService.getCall('news/getnews?type_category=${index}')
        : resdata = await apiService.getCall(
            'news/getnewsbyid?type_category=${index}&user_id=${widget.userid}');
    ;

    log("${resdata}");
    setState(() {
      data2 = resdata['data'];
      // dropdownvalue = data2[0]["id"];
      temp = true;
      print(data2);
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
                  width: (Responsive.ismobile(context)) ? 200 : 300,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: DropdownButtonFormField<String>(
                      // alignment: Alignment.center,
                      isExpanded: true,
                      value: dropdownvalue,
                      onChanged: (value) {
                        setState(() {
                          dropdownvalue = value!;
                          init1(int.parse(dropdownvalue));
                          temp = false;
                          log("${dropdownvalue}");
                        });
                      },
                      items: [
                        for (var data in data1)
                          DropdownMenuItem(
                            value: "${data['id']}",
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
              child: (temp == true)
                  ? (data2.isNotEmpty)
                      ? ListView(
                          children: [
                            for (var item in data2)
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 100,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.black,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        "http://144.91.124.145/~codecha/trigger_news/" +
                                            item["image"],
                                        height: 100,
                                        width: 150,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          maxLines: 3,
                                          "${item["headline"]}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${item["added_datetime"]}"
                                              .toString()
                                              .substring(0, 10),
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 17),
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
                    ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
