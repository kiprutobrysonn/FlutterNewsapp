import 'package:flutter/material.dart';

class OtpVerification extends StatefulWidget {
  OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  bool hovercolor = false;
  int c_index = 0;

  String? selectedValue1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OTP Verification",
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
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Table(
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
                            "Mobile Number / Email",
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
                            "Iocns",
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
                            "Date",
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
                            "User Id",
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
                            "Action",
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
                                    "denishgujarati@gmail.com",
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
                                    child: Icon(
                                      Icons.email_outlined,
                                      size: 27,
                                      color: Colors.blue,
                                    )),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "17/04/23",
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
                                  child: Text(
                                    "123 456 789 0000",
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
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                    Expanded(
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
      ),
    ));
  }
}
