import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_reporter/apiService.dart';
import 'package:user_reporter/responsive.dart';

class State1 extends StatefulWidget {
  State1({Key? key}) : super(key: key);

  @override
  State<State1> createState() => _State1State();
}

class _State1State extends State<State1> {
  var userid;
  // GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isloade = false;
  File? file;
  ImagePicker picker = ImagePicker();
  XFile? image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
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

  Uint8List? webimage1;
  File? photo;
  ApiService apiService = ApiService();
  TextEditingController name = TextEditingController();
  var im;

  // Future<void> imagessss() async {
  //   Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
  //   if (bytesFromPicker != null) {
  //     webimage1 = bytesFromPicker;
  //     setState(() {});
  //   }
  // }

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
                "State",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 35,
                child: OutlinedButton(
                  style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all(Colors.blue),
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.blue))),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            contentPadding: EdgeInsets.all(
                                (Responsive.isdekstop(context)) ? 25 : 10),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Add State",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(
                                        (Responsive.isdekstop(context))
                                            ? 20
                                            : 0),
                                    padding: EdgeInsets.all(
                                        (Responsive.isdekstop(context))
                                            ? 20
                                            : 5),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade200,
                                            blurRadius: 5.0)
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Upload Image",
                                              style: TextStyle(
                                                color: Colors.black,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            StatefulBuilder(
                                              builder: (context, setState1) {
                                                return GestureDetector(
                                                  onTap: () async {
                                                    image =
                                                        await picker.pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                    if (image != null) {
                                                      setState1(() {
                                                        setState(() {
                                                          file =
                                                              File(image!.path);
                                                          print(
                                                              "Image Name :- " +
                                                                  file!.path);
                                                        });
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    height:
                                                        (Responsive.isdekstop(
                                                                context))
                                                            ? 300
                                                            : 200,
                                                    // width: (Responsive.isdekstop(
                                                    //         context))
                                                    //     ? 670
                                                    //     : 350,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.5,
                                                    margin: EdgeInsets.all(10),
                                                    child: file == null
                                                        ? Image.asset(
                                                            "assets/pickimage.png",
                                                            fit: BoxFit.fill,
                                                          )
                                                        : ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            child:
                                                                Image.network(
                                                              file!.path
                                                                  .toString(),
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              (Responsive.isdekstop(context))
                                                  ? 50
                                                  : 30,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Enter You State Name",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Container(
                                                  // width: (Responsive.isdekstop(
                                                  //         context))
                                                  //     ? 670
                                                  //     : 300,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.5,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: TextField(
                                                    controller: name,
                                                    decoration: InputDecoration(
                                                      suffixIcon:
                                                          Icon(Icons.search),
                                                      fillColor:
                                                          Colors.grey[100],
                                                      filled: true,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          width: 0,
                                                          style:
                                                              BorderStyle.none,
                                                        ),
                                                      ),
                                                      hintText:
                                                          'Enter a search term',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.5,
                                                  height: 40,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      try {
                                                        var multifile =
                                                            await MultipartFile
                                                                .fromString(
                                                                    file!.path);
                                                        var data = Map<String,
                                                            dynamic>();
                                                        data["name"] =
                                                            name.text;
                                                        data["image"] =
                                                            multifile;
                                                        log("data ${data}");
                                                        var resdata =
                                                            await apiService
                                                                .postCall(
                                                                    "state/addstate",
                                                                    data);
                                                        log("resdata ${resdata}");
                                                        if (resdata[
                                                                "success"] ==
                                                            1) {
                                                          isloade = false;
                                                          init();
                                                          // ignore: use_build_context_synchronously
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      } catch (e) {
                                                        print("Error $e");
                                                      }
                                                    },
                                                    child: Text("Add Data"),
                                                  ),
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
                            ));
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Add State",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ],
                  ),
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
                  0: FlexColumnWidth(4),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth((Responsive.isdekstop(context)) ? 1 : 2),
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
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Delete",
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
                ? (data1.isEmpty || data1 == Null)
                    ? Center(
                        child: Text("No Data"),
                      )
                    : Container(
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
                                  0: FlexColumnWidth(4),
                                  1: FlexColumnWidth(4),
                                  2: FlexColumnWidth(
                                      (Responsive.isdekstop(context)) ? 1 : 2),
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
                                          padding: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: (Responsive.isdekstop(
                                                      context))
                                                  ? 60
                                                  : 20,
                                              right: (Responsive.isdekstop(
                                                      context))
                                                  ? 60
                                                  : 20),
                                          child: Container(
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Image.network(
                                              // 'http://144.91.124.145/~codecha/trigger_news/' +
                                              data1[index]["image"],
                                              fit: BoxFit.fill,
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
                                            "${data1[index]["name"]}",
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
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 25,
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
    ));
  }
}
