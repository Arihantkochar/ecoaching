import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/styles/common.dart';
import 'package:mymasterje/techerscreens/TeacherHome.dart';
import 'package:mymasterje/widgets/Button.dart';
import 'package:mymasterje/widgets/FormTextField.dart';
import 'dart:io' as io;
import 'package:file_picker/file_picker.dart';


class TeacherForm extends StatefulWidget {
  @override
  _TeacherFormState createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  TextEditingController name = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController alternatemobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController experiance = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  io.File file;
  UploadTask task;

  String grade, subject1, subject2, subject3,states,syllabus1;

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
            FormTextField(name, "Name"),
            FormTextField(qualification, "Qualification"),
            FormTextField(experiance, "Work Experience"),
            FormTextField(alternatemobile, "Alternate Mobile No."),
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
                    value: grade,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: (gradelist)
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
                      "  " + "Grade Preference",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        grade = value;
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
                    value: subject1,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items:
                        (subject).map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "  " + "Subject Proficiency 1",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        subject1 = value;
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
                    value: subject2,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items:
                        (subject).map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "  " + "Subject Proficiency 2",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        subject2 = value;
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
                    value: subject3,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items:
                        (subject).map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "  Subject Proficiency 3",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        subject3 = value;
                      });
                    },
                  ),
                ),
              ),
            ), SizedBox(
              height: screenHeight(context, dividedBy: 38),
            ),
            Button(text: "Upload Resume",onpressed: () async{
              try {
                FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: false);
                if(result != null) {
                  final path  = result.files.single.path;
                  setState(() {
                    file = io.File(path);
                  });
                  final ref = FirebaseStorage.instance.ref("resume/${name.text}");
                  task =  ref.putFile(file);

                } else {
                  // User canceled the picker
                  Navigator.pop(context);
                }
                // File file = await FilePicker.(type: FileType.custom);
                // String filename = title.text + '.pdf';
                // var url = await savePdf(file.readAsBytesSync(), filename);
                //print(url);
                //return url;
              } catch (e) {
                print(e.toString());
              }

            },),
            SizedBox(height: 5,),
            Text("Please wait for a while when your resume is Uploading..."),
            SizedBox(
              height: screenHeight(context, dividedBy: 38),
            ),
            Button(
              text: "Submit",
              onpressed: () {
                print(subject1);
                print(grade);
                var firebaseUser = FirebaseAuth.instance.currentUser;
                firestoreInstance
                    .collection("users")
                    .doc(firebaseUser.uid)
                    .set({
                  "name": name.text,
                  "alternatemobile": alternatemobile.text,
                  "contactno": firebaseUser.phoneNumber,
                  "email": email.text,
                  "subject1": subject1,
                  "subject2": subject2,
                  "subject3": subject3,
                  "grade": grade,
                  "role": "teacher",
                  "experience":experiance.text,
                  "state":states,
                  "meetlink":null,
                  "syllabus":syllabus1
                }, SetOptions(merge: true)); /**/
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => TeacherHome()));
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
