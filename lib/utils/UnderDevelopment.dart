import 'package:flutter/material.dart';
import 'package:mymasterje/Widgets/Button.dart';

import '../view.dart';
class UnderDevelopment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Center(
        child: Button(text: "Schedule Meeting",onpressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectStudentScreen()));
        },),
      ),
    );
  }
}
