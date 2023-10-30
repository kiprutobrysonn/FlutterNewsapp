import 'package:flutter/material.dart';
import 'package:user_reporter/Extension/extensions_export.dart';

class Header extends StatefulWidget {
  Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => HeaderState();
}

class HeaderState extends State<Header> {
  bool temp = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5.0)],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: (temp == false)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (Responsive.isdekstop(context))
                      ? Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Image.asset(
                            "assets/logo.png",
                            height: 50,
                          ),
                        )
                      : SizedBox(),
                  (Responsive.isdekstop(context))
                      ? Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: (Responsive.isdekstop(context)) ? 30 : 0),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: SizedBox(),
                        ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      (Responsive.isdekstop(context))
                          ? SizedBox()
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  temp = true;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.notifications_off_outlined,
                          color: Colors.black,
                        ),
                      ),
                      (Responsive.isdekstop(context))
                          ? Container(
                              child: TextButton(
                                onPressed: () {},
                                child: Text("Log in"),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        child: Image.asset(
                          "assets/man.png",
                        ),
                      ),
                      (Responsive.isdekstop(context))
                          ? Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text("My Account "),
                            )
                          : SizedBox(),
                      (Responsive.isdekstop(context))
                          ? Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: (Responsive.isdekstop(context)) ? 30 : 0),
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        temp = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ));
  }
}
