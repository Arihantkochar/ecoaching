import 'package:flutter/material.dart';
import 'package:mymasterje/Widgets/Button.dart';

import '../view.dart';
class UnderDevelopment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor:Colors.white,
      body: Center(
        child:Text("COMING SOON!",style: TextStyle(color: Theme.of(context).primaryColorLight,fontSize: 38,fontWeight: FontWeight.bold),)
      ),
    );
  }
}
