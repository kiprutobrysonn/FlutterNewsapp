import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:user_reporter/responsive.dart';

class Notification1 extends StatefulWidget {
  Notification1({Key? key}) : super(key: key);

  @override
  State<Notification1> createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  Uint8List? webimage1;

  bool open = false;
  File? photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              "Notification",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all((Responsive.isdekstop(context)) ? 45 : 15),
            padding: EdgeInsets.all((Responsive.isdekstop(context)) ? 45 : 15),
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
            child: Expanded(
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
                  GestureDetector(
                    onTap: () async {
                      Uint8List? bytesFromPicker =
                          await ImagePickerWeb.getImageAsBytes();
                      if (bytesFromPicker != null) {
                        webimage1 = bytesFromPicker;
                        setState(() {});
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      height: (Responsive.isdekstop(context)) ? 350 : 200,
                      width: MediaQuery.of(context).size.width,
                      child: (webimage1 == null)
                          ? Image.asset(
                              "assets/pickimage.png",
                              fit: BoxFit.fill,
                            )
                          : Image.memory(
                              webimage1!,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          "Heading Title",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: 'Heading',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                        child: Text(
                          "Description Title",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Description...',
                          ),
                          cursorColor: Colors.grey,
                          minLines: 6,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          "Link",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: 'Link',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
