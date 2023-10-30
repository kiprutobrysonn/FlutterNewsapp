import 'package:flutter/material.dart';

class UserData extends StatefulWidget {
  UserData({Key? key}) : super(key: key);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  bool hovercolor = false;
  int c_index = 0;

  String? selectedValue1;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Image.asset(
                "assets/logo.png",
                height: 50,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 30),
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
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                Container(
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Log in"),
                  ),
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/image.png",
                    height: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("My Account "),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 10),
          child: Text(
            "Reporter Data",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 0,
          child: Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(w * 0.005),
                topRight: Radius.circular(w * 0.005),
              ),
            ),
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(1),
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
                      topLeft: Radius.circular(w * 0.005),
                      topRight: Radius.circular(w * 0.005),
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
                            fontSize: w / 105,
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
                          "Reporter Name",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: w / 105,
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
                          "Action",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: w / 105,
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
          child: Container(
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
                        0: FlexColumnWidth(1),
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
                                  "1",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: w / 100,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Denish",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: w / 110,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                      size: 25,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 25,
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: OutlinedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.blue),
                                              ),
                                              onPressed: () {},
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}
