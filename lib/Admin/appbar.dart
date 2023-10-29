import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => HeaderState();
}

class HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5.0)],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 500,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                fillColor: Colors.grey[100],
                filled: true,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                hintText: 'Enter a search term',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
