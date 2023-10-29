import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_reporter/Admin/apiService.dart';
import 'package:user_reporter/responsive.dart';

class Category1 extends StatefulWidget {
  Category1({Key? key}) : super(key: key);

  @override
  State<Category1> createState() => _Category1State();
}

class _Category1State extends State<Category1>
    with SingleTickerProviderStateMixin {
  ApiService apiService = ApiService();
  TextEditingController name = TextEditingController();
  DateTime date = DateTime.now();

  File? file;
  ImagePicker picker = ImagePicker();
  XFile? image;

  // GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  List data1 = [];
  init() async {
    var resdata = await apiService.getCall('category/getCategory');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all((Responsive.isdekstop(context)) ? 20 : 10),
            child: Row(
              children: [
                Text(
                  "Category",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Text(
            "Add Category",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 30),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(0, 0),
                  spreadRadius: 4,
                  blurRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Upload Image",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
                StatefulBuilder(
                  builder: (context, setState1) {
                    return GestureDetector(
                      onTap: () async {
                        image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          setState(() {
                            file = File(image!.path);
                            print("Image Name :- " + image!.path);
                          });
                        }
                      },
                      child: Container(
                        height: (Responsive.isdekstop(context)) ? 350 : 200,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: (file == null)
                            ? Image.asset(
                                "assets/pickimage.png",
                                fit: BoxFit.fill,
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  file!.path.toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Enter Your Category Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: name,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Category Name',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        var multifile = await MultipartFile.fromString(
                            file!.path.toString());
                        var data = Map<String, dynamic>();
                        data["image"] = multifile;
                        data["catrgory_name"] = name.text;

                        var resdata = await apiService.postCall(
                            "category/addCategory", data);

                        if (resdata["success"] == 1) {
                          init();
                          // Navigator.pop(context);
                          print("Succes");
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text("Add Category"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
