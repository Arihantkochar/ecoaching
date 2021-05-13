import 'package:flutter/material.dart';
import 'package:mymasterje/screens/ChooseProfession.dart';
import 'package:mymasterje/styles/common.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChooseProfession(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Image.asset("assets/images/Logo.png",fit: BoxFit.contain,),
      )
    );
  }
}
