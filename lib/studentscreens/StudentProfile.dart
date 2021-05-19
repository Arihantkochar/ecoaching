import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mymasterje/screens/Loading.dart';
import 'package:mymasterje/screens/Splash.dart';
import 'package:mymasterje/styles/common.dart';
import 'package:mymasterje/widgets/Button.dart';

class StudentProfile extends StatefulWidget {
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  var firebaseInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController fname = TextEditingController(text: "");
  TextEditingController mname = TextEditingController(text: "");
  TextEditingController contactno = TextEditingController(text: "");
  TextEditingController alternatecontactno = TextEditingController(text: "");
  TextEditingController email = TextEditingController(text: "");
  TextEditingController grade = TextEditingController(text: "");
  TextEditingController school = TextEditingController(text: "");

  Widget editabletextfield(
          String hinttext, String label, TextEditingController controller) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
          TextField(
            controller: controller,
            onChanged: (value) {
              setState(() {
                print(value);
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hinttext == null ? "-" : hinttext.toString(),
              hintStyle: TextStyle(
                  fontSize: 18, color: Theme.of(context).primaryColorLight),
              alignLabelWithHint: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 0.3,
              width: screenWidth(context, dividedBy: 1.1),
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
      ),
      body: StreamBuilder(
          stream: firebaseInstance
              .collection('users')
              .doc(firebaseUser.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Loading();
            return SingleChildScrollView(
              child: Container(
                height: screenHeight(context)*2.5,
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    Container(
                      child: Center(
                          child: Container(
                        height: screenHeight(context, dividedBy: 8),
                        width: screenWidth(context, dividedBy: 1.1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.person,
                                color: Theme.of(context).primaryColorLight,
                                size: 70,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data['name'],
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      )),
                      height: screenSize(context).height * 0.30,
                    ),
                    SingleChildScrollView(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35)),
                        child: Container(
                          color: Theme.of(context).primaryColorLight,
                          height: screenSize(context).height * 2.5,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              height: screenHeight(context) * 2.5,
                              decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white),
                              child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                editabletextfield(snapshot.data['fname'],
                                    "Father's Name", fname),
                                editabletextfield(snapshot.data['mname'],
                                    "Mother's Name", mname),
                                editabletextfield(
                                    snapshot.data['contactno'],
                                    "Contact No.",
                                    contactno),
                                editabletextfield(
                                    snapshot.data['alternatemobile'],
                                    "Alternate Contact No.",
                                    alternatecontactno),
                                editabletextfield(snapshot.data['email'],
                                    "Email Id", email),
                                editabletextfield(
                                    snapshot.data['grade'], "Grade", grade),
                                editabletextfield(snapshot.data['school'],
                                    "School", school),
                                SizedBox(
                                  height: 20,
                                ),
                                Button(
                                  text: "SAVE",
                                  onpressed: () {
                                    print("Save clicked");
                                    print(fname.text);
                                    firebaseInstance
                                        .collection('users')
                                        .doc(firebaseUser.uid)
                                        .update({
                                      "fname": fname.text == ""
                                          ? snapshot.data['fname']
                                          : fname.text,
                                      "mname": mname.text == ""
                                          ? snapshot.data['mname']
                                          : mname.text,
                                      "contactno": contactno.text == ""
                                          ? snapshot.data['contactno']
                                          : contactno.text,
                                      "alternatemobile":
                                          alternatecontactno.text == ""
                                              ? snapshot
                                                  .data['alternatemobile']
                                              : alternatecontactno.text,
                                      "email": email.text == ""
                                          ? snapshot.data['email']
                                          : email.text,
                                      "grade": grade.text == ""
                                          ? snapshot.data['grade']
                                          : grade.text,
                                      "school": school.text == ""
                                          ? snapshot.data['school']
                                          : school.text,
                                    }).then((_) {
                                      print("success!");
                                    });
                                  },
                                ),
                                SizedBox(height: 10,),
                                Button(
                                  text: "Log Out",
                                  onpressed: () async {
                                    await _auth.signOut();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SplashScreen()));
                                  },
                                )
                              ],
                            ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
