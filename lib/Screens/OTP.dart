import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/adminscreens/Password.dart';
import 'package:mymasterje/parentscreens/ParentHome.dart';
import 'package:mymasterje/school/SchoolHome.dart';
import 'package:mymasterje/screens/ChooseProfession.dart';
import 'package:mymasterje/studentscreens/StudentForm.dart';
import 'package:mymasterje/studentscreens/StudentHome.dart';
import 'package:mymasterje/studentscreens/StudentProfile.dart';
import 'package:mymasterje/techerscreens/TeacherHome.dart';
import 'package:mymasterje/techerscreens/TeacherProfile.dart';
import 'package:mymasterje/utils/LoginBackground.dart';
import 'package:mymasterje/utils/UnderDevelopment.dart';
import 'package:mymasterje/widgets/Login.dart';
import 'package:mymasterje/widgets/LoginTextField.dart';

import 'Home.dart';
import 'LoginScreen.dart';

class OTP extends StatefulWidget {
  String verificationId;
  FirebaseAuth firebaseAuth;

  OTP(this.verificationId, this.firebaseAuth);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController otp = TextEditingController();
  var firestoreInstance = FirebaseFirestore.instance;

  checkroleexist() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    firestoreInstance
        .collection("users")
        .doc(firebaseUser.uid)
        .get()
        .then((value) {
      if (value.data()['role'] == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ChooseProfession()));
      } else {
        if (value.data()['role'] == 'student')
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => StudentHome()));
        if (value.data()['role'] == 'teacher')
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TeacherHome()
                  //TODO

                  ));
        if (value.data()['role'] == 'admin')
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Password()
                //TODO

              ));
        if (value.data()['role'] == 'parent')
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ParentHome()
                //TODO

              ));
        if(value.data()['role'] == 'college' || value.data()['role'] == 'school')
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SchoolHome(),
              ));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Background(),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.3),
              ),
              Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 40, bottom: 10),
                        child: Text(
                          "OTP",
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColorLight),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: <Widget>[
                          InputWidget(30.0, 0.0, otp, ""),
                          Padding(
                              padding: EdgeInsets.only(right: 50),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(top: 40),
                                    child: Text(
                                      'Enter OTP...',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Color(0xFFA0A0A0),
                                          fontSize: 12),
                                    ),
                                  )),
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 50),
                  ),
                  InkWell(
                      onTap: () async {
                        print(
                            'The otp is ${otp.text} and verificationID is ${widget.verificationId}');
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: widget.verificationId,
                                smsCode: otp.text);

                        UserCredential result = await widget.firebaseAuth
                            .signInWithCredential(credential);
                        firestoreInstance
                            .collection('users')
                            .doc(result.user.uid)
                            .set({"contactno": result.user.phoneNumber},
                                SetOptions(merge: true));
                        checkroleexist();
                      },
                      child:
                          roundedRectButton("Verify", signInGradients, false)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
