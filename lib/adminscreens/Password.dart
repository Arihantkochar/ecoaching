import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/screens/Splash.dart';
import 'package:mymasterje/utils/LoginBackground.dart';
import 'package:mymasterje/utils/UnderDevelopment.dart';
import 'package:mymasterje/widgets/Login.dart';
import 'package:mymasterje/widgets/LoginTextField.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController password = TextEditingController();
  var firebaseInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height / 2.3),
              ),
              Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 40, bottom: 10),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme
                                  .of(context)
                                  .primaryColorLight),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: <Widget>[
                          InputWidget(30.0, 0.0, password, ""),
                          Padding(
                              padding: EdgeInsets.only(right: 50),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 40),
                                        child: Text(
                                          'Enter Password...',
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
                        firebaseInstance.collection('users')
                            .doc(firebaseUser.uid)
                            .get()
                            .then((value) {
                          if (value.data()['password'] == password.text){
                            firebaseInstance.collection('users').doc(firebaseUser.uid).set({
                              "role":"admin",
                            },SetOptions(merge: true));
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) =>
                                UnderDevelopment()));
                          }
                          else{
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) =>
                                SplashScreen()));
                          }
                        });
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
