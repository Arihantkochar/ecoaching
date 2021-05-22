import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mymasterje/adminscreens/Password.dart';
import 'package:mymasterje/college/CollegeForm.dart';
import 'package:mymasterje/parentscreens/ParentForm.dart';
import 'package:mymasterje/school/SchoolForm.dart';
import 'package:mymasterje/studentscreens/StudentForm.dart';
import 'package:mymasterje/techerscreens/TeacherForm.dart';
import 'package:mymasterje/utils/LoginBackground.dart';
import 'package:mymasterje/screens/LoginScreen.dart';
import 'package:mymasterje/utils/UnderDevelopment.dart';
import 'package:mymasterje/widgets/WelcomeScreenCard.dart';
import '../styles/common.dart';

class ChooseProfession extends StatelessWidget {
  var firebaseInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "WELCOME",
                    style:
                        GoogleFonts.fredokaOne(fontSize: 50, color: Colors.black),
                  ),
                ),
                height: screenSize(context).height * 0.30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35)),
                child: Container(
                  color: Theme.of(context).splashColor,
                  height: screenSize(context).height * 0.70,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Are you a:",
                            style: TextStyle(color: Colors.black, fontSize: 45),
                          ),
                          Row(
                            children: [
                              WelcomeScreenCard(context,
                                  'assets/images/student.png', "Student", () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StudentForm()));
                              }),
                              WelcomeScreenCard(
                                  context, 'assets/images/parent.png', "Parent",
                                  () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Parentform()));
                              })
                            ],
                          ),
                          Row(
                            children: [
                              WelcomeScreenCard(
                                context,
                                "assets/images/teacher.png",
                                "Teacher",
                                () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TeacherForm()));
                                },
                              ),
                              WelcomeScreenCard(
                                  context, "assets/images/admin.png", "Admin",
                                  () {
                                firebaseInstance
                                    .collection('users')
                                    .doc(firebaseUser.uid)
                                    .set({
                                  "password": "houseoftroyy",
                                }, SetOptions(merge: true));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Password()));
                              })
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SchoolForm()));
                                  //TODO
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Image.asset(
                                    "assets/images/school button.png",
                                    scale: 3.5,
                                  ),
                                ),
                              ),
                              SizedBox(width: screenWidth(context,dividedBy: 12),),
                              InkWell(
                                onTap: (){
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CollegeForm()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Image.asset(
                                    "assets/images/college button.png",
                                    scale: 3.5,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
