import 'package:flutter/material.dart';
import 'package:mymasterje/styles/common.dart';

class FormDropdown extends StatefulWidget {
  List <String>list ;
  String text;
  String chosenValue;

  FormDropdown(this.list,this.text,this.chosenValue);

  @override
  _FormDropdownState createState() => _FormDropdownState();
}

class _FormDropdownState extends State<FormDropdown> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: screenHeight(context,dividedBy: 1.5),
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            focusColor:Colors.white,
            value: widget.chosenValue,
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor:Colors.black,
            items: (widget.list).map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,style:TextStyle(color:Colors.black),),
              );
            }).toList(),
            hint:Text(
              "  "+widget.text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String value) {
              setState(() {
                widget.chosenValue = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
