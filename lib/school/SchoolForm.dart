import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/school/SchoolHome.dart';
import 'package:mymasterje/styles/common.dart';
import 'package:mymasterje/utils/UnderDevelopment.dart';
import 'package:mymasterje/widgets/FormTextField.dart';
import 'package:mymasterje/widgets/Button.dart';


class SchoolForm extends StatefulWidget {
  @override
  _SchoolFormState createState() => _SchoolFormState();
}

class _SchoolFormState extends State<SchoolForm> {
  TextEditingController schoolname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController acontactno = TextEditingController();
  List <String>profession = ["Owner","Principal","Vice Principal","Administrator"];
  String syllabus1,relation;
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight(context, dividedBy: 10),
            ),
            Text(
              "REGISTRATION FORM",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "PLEASE FILL THE GIVEN FORM TO PROCEED.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight(context, dividedBy: 38),
            ),
            FormTextField(schoolname, "School Name"),
            FormTextField(address, "Address"),
            FormTextField(name, "Your Name"),
            FormTextField(acontactno, "Official Contact No."),
            FormTextField(email, "Email ID"),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: screenHeight(context, dividedBy: 1.5),
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    value: relation,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: (profession)
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "  " + "I'M A",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        relation = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: screenHeight(context, dividedBy: 1.5),
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    value: syllabus1,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: (syllabus)
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "  " + "Syllabus",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        syllabus1 = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Button(
              text: "Submit",
              onpressed: () {
                var firebaseUser = FirebaseAuth.instance.currentUser;
                firestoreInstance
                    .collection("users")
                    .doc(firebaseUser.uid)
                    .set({
                  "schoolname":schoolname.text,
                  "name": name.text,
                  "alternatemobile": acontactno.text,
                  "contactno": firebaseUser.phoneNumber,
                  "email": email.text,
                  "relationwithschool":relation,
                  "syllabus": syllabus1,
                  "meetlink":null,
                  "address":address.text,
                  "role":"school"
                }, SetOptions(merge: true)); /**/
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SchoolHome()));
              },
            ),
            SizedBox(
              height: screenHeight(context, dividedBy: 18),
            ),
          ],
        ),
      ),
    );
  }
}
