import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final double topRight;
  final double bottomRight;
  TextEditingController mobileno ;
  String prefix;

  InputWidget(this.topRight, this.bottomRight,this.mobileno,this.prefix);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40, bottom: 30),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        child: Material(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(bottomRight),
                  topRight: Radius.circular(topRight))),
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
            child: TextField(
              //keyboardType: TextInputType.number,
              controller: mobileno,
              decoration: InputDecoration(
                prefixText: prefix,
                  border: InputBorder.none,
                  hintText: "1234567890",
                  hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
            ),
          ),
        ),
      ),
    );
  }
}