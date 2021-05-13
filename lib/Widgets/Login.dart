import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/screens/Home.dart';
import 'package:mymasterje/screens/Loading.dart';
import 'package:mymasterje/screens/OTP.dart';
import 'package:mymasterje/studentscreens/StudentForm.dart';
import 'package:mymasterje/widgets/LoginTextField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var firebaseAuth = FirebaseAuth.instance;
  TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
          ),
          Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 40, bottom: 10),
                    child: Text(
                      "Mobile No",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      InputWidget(30.0, 0.0, mobile,"+91"),
                      Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                  'Enter your Mobile No. to continue...',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Color(0xFFA0A0A0), fontSize: 12),
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
                  onTap: () {
                    print("+91"+mobile.text);
                    firebaseAuth.verifyPhoneNumber(
                      phoneNumber: "+91"+mobile.text,
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        await firebaseAuth
                            .signInWithCredential(credential)
                            .then((UserCredential result) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => StudentForm()));
                        })
                            .catchError((e) {
                          print(e);
                        });

                      },
                      verificationFailed: (FirebaseAuthException e) {
                        if (e.code == 'invalid-phone-number') {
                          print('The provided phone number is not valid.');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Login failed,Try again")));
                        }
                      },
                      codeSent: (String verificationId, int resendToken) async {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OTP(verificationId, firebaseAuth)));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        timeout: const Duration(seconds: 60);

                        // Auto-resolution timed out...
                      },
                    );
                  },
                  child: roundedRectButton(
                      "Let's get Started", signInGradients, false)),
            ],
          )
        ],
      ),
    );
  }
}

Widget roundedRectButton(
    String title, List<Color> gradient, bool isEndIconVisible) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment(1.0, 0.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(mContext).size.width / 1.7,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            padding: EdgeInsets.only(top: 16, bottom: 16),
          ),
          Visibility(
            visible: isEndIconVisible,
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: ImageIcon(
                  AssetImage("assets/images/ic_forward.png"),
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  });
}

const List<Color> signInGradients = [
  Color(0xFF5AEAF1),
  Color(0xFF295D66),
];