import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/parentscreens/ParentHome.dart';
import 'package:mymasterje/styles/common.dart';
import 'package:mymasterje/widgets/FormTextField.dart';
import 'package:mymasterje/widgets/Button.dart';

class Parentform extends StatefulWidget {
  @override
  _ParentformState createState() => _ParentformState();
}

class _ParentformState extends State<Parentform> {
  TextEditingController name = TextEditingController();
  TextEditingController studentname = TextEditingController();
  TextEditingController residentialadress = TextEditingController();
  TextEditingController alternatemobile = TextEditingController();
  TextEditingController email = TextEditingController();
  String relation,states;
  final firestoreInstance = FirebaseFirestore.instance;
  List <String> relationship = ["Father","Mother","Guardian","Sibling"];
  Widget dropdownform(String _value, List<String> list, String text) {
    return Padding(
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
            value: _value,
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
            items: (list).map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            hint: Text(
              "  " + text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ),
    );
  }
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "PLEASE FILL THE GIVEN FORM TO PROCEED.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight(context, dividedBy: 38),
            ),
            FormTextField(name, "Name"),
            FormTextField(studentname, "Student's Name"),
            FormTextField(email, "Email ID"),
            FormTextField(alternatemobile, "Alternate Mobile No."),
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
                    items:
                    (relationship).map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "  " + "Relation With Student",
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
                    value: states,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items:
                    (state).map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "  " + "State",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        states = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight(context, dividedBy: 38),
            ),
            if (name.text != null && email.text != null)
              Button(
                text: "Submit",
                onpressed: () {
                  var firebaseUser = FirebaseAuth.instance.currentUser;
                  firestoreInstance
                      .collection("users")
                      .doc(firebaseUser.uid)
                      .set({
                    "name": name.text,
                    "studentname": studentname.text,
                    "alternatemobile": alternatemobile.text,
                    "contactno": firebaseUser.phoneNumber,
                    "email": email.text,
                    "relation":relation,
                    "state":states,
                    "role": "parent"
                  },SetOptions(merge: true));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ParentHome()));
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
