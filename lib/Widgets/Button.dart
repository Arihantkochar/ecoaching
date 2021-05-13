import 'package:flutter/material.dart';
import 'package:mymasterje/styles/common.dart';

class Button extends StatelessWidget {
  String text;
  Function onpressed;

  Button({this.text,this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context,dividedBy:1.1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
         color: Theme.of(context).primaryColor ),
      child: RaisedButton(
        elevation: 2.0,
        onPressed:onpressed,
        padding: EdgeInsets.all(15.0),
        color: Colors.transparent,
        child: Text(text,
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
