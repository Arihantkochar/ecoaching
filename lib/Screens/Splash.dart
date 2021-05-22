import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/adminscreens/AdminHome.dart';
import 'package:mymasterje/parentscreens/ParentHome.dart';
import 'package:mymasterje/school/SchoolHome.dart';
import 'package:mymasterje/screens/ChooseProfession.dart';
import 'package:mymasterje/screens/LoginScreen.dart';
import 'package:mymasterje/studentscreens/StudentHome.dart';
import 'package:mymasterje/studentscreens/StudentProfile.dart';
import 'package:mymasterje/styles/common.dart';
import 'package:mymasterje/techerscreens/TeacherHome.dart';
import 'package:mymasterje/techerscreens/TeacherProfile.dart';
import 'package:mymasterje/utils/UnderDevelopment.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      FirebaseAuth.instance.authStateChanges().listen((User user) {
        if(user == null)
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        else
        FirebaseFirestore.instance.collection('users').doc(user.uid).get().then((value) {
         if(value.data()['role'] == "student")
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => StudentHome(),
              ));
        else if(value.data()['role'] == "teacher")
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TeacherHome(),
              ));
        else if(value.data()['role'] == "admin")
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AdminHome(),
              ));
        else if(value.data()['role'] == "parent")
           Navigator.pushReplacement(
               context,
               MaterialPageRoute(
                 builder: (context) => ParentHome(),
               ));
        else if(value.data()['role'] == null)
           Navigator.pushReplacement(
               context,
               MaterialPageRoute(
                 builder: (context) => LoginScreen(),
               ));
        else if(value.data()['role'] == 'college' || value.data()['role'] == 'school')
           Navigator.pushReplacement(
               context,
               MaterialPageRoute(
                 builder: (context) => SchoolHome(),
               ));
        });
      });
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
