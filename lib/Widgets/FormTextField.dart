import 'package:flutter/material.dart';
import 'package:mymasterje/styles/common.dart';

class FormTextField extends StatefulWidget {
  TextEditingController controller;
  String hinttext;

  FormTextField(this.controller,this.hinttext);

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: screenHeight(context,dividedBy: 1.5),
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: widget.hinttext,
              labelStyle: TextStyle(color: Colors.black),
              fillColor: Colors.white,
              hintText: widget.hinttext,
              focusedBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide:  BorderSide(color: Colors.black),

              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColorLight, width: 2.0),
              )),
        ),
      ),
    );
  }
}
