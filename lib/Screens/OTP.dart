import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/studentscreens/StudentForm.dart';
import 'package:mymasterje/utils/LoginBackground.dart';
import 'package:mymasterje/widgets/Login.dart';
import 'package:mymasterje/widgets/LoginTextField.dart';

import 'Home.dart';
import 'LoginScreen.dart';

class OTP extends StatefulWidget {
  String verificationId;
  FirebaseAuth firebaseAuth;

  OTP(this.verificationId,this.firebaseAuth);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController otp = TextEditingController();

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
                          InputWidget(30.0, 0.0, otp,""),
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
                      onTap: () async{
                        print('The otp is ${otp.text} and verificationID is ${widget.verificationId}');
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(
                            verificationId: widget.verificationId, smsCode: otp.text);
                        UserCredential result =  await widget.firebaseAuth.signInWithCredential(credential);
                        User user1 = result.user;
                        if(user1!=null){
                          //TODO implement homee page
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => StudentForm()));
                        }
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
