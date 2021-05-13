import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mymasterje/styles/common.dart';
 class Loading extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: SingleChildScrollView(child: Container(
           height: screenHeight(context),
           color: Theme.of(context).primaryColor,
           child: Column(
             children: <Widget>[
               Container
                 (
                 height: 500,
                 child: Center(
                   child: SpinKitSpinningCircle
                     (
                     color: Theme.of(context).primaryColorLight,
                     size: 50.0,
                   ),
                 ),
               ),
               Text('Loading...',
                 style: TextStyle(color: Theme.of(context).primaryColorLight,fontSize: 18),)
             ],
           ),
       )),
     );
   }
 }
