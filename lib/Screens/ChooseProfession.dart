import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mymasterje/adminscreens/Password.dart';
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
      body: SafeArea(
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
              SingleChildScrollView(
                child: ClipRRect(
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
                              "Are You A?",
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
                                              UnderDevelopment()));
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/school.png",
                                    scale: 5,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/college.png",
                                    scale: 5,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
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
