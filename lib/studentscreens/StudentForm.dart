import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/styles/common.dart';
import 'package:mymasterje/widgets/Button.dart';
import 'package:mymasterje/widgets/FormTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mymasterje/widgets/Formdropdown.dart';

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  TextEditingController name = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController mname = TextEditingController();
  TextEditingController school = TextEditingController();
  TextEditingController alnernatemobile = TextEditingController();
  TextEditingController email = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  List<String> gradelist = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  List<String> subject = [
    'English',
    'Hindi',
    'Mathematics',
    'Physics',
    'Chemistry',
    'Biology',
    'Computer Science',
    'General Science',
    'Social Studies',
    'History',
    'Civics',
    'Geography'
  ];
  List<String> timings = [
    "8:30",
    "9:30",
    "10:30",
    "11:30",
    "12:30",
    "13:30",
    "14:30",
    "15:30",
    "16:30",
    "17:30",
    "18:30",
    "19:30",
  ];
  String standard, subject1, subject2, subject3, time1, time2, grade;

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
              "Please fill the given form to proceed...",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight(context, dividedBy: 38),
            ),
            FormTextField(name, "Name"),
            FormTextField(fname, "Father's Name"),
            FormTextField(mname, "Mother's Name"),
            FormTextField(email, "Email"),
            FormTextField(school, "School"),
            FormTextField(alnernatemobile, "Alternate Mobile No."),
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
                      "  " + "Grade",
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
                      "  " + "Subject1",
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
                      "  " + "Subject2",
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
                      "  Subject3",
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
                    value: time1,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items:
                        (timings).map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "  Flexible Time 1",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        time1 = value;
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
                    value: time2,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items:
                        (timings).map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "  Flexible Time 2",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        time2 = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            /* dropdownform(grade, gradelist, "Grade"),
            dropdownform(subject1, subject, "Subject1"),
            dropdownform(subject2, subject, "Subject2"),
            dropdownform(subject3, subject, "Subject3"),
            dropdownform(time1, timings, "FLexible Time1"),
            dropdownform(time2, timings, "Flexible Time2"),*/
            /* FormDropdown(subject, "Subject1", subject1),
            FormDropdown(subject, "Subject2", subject2),
            FormDropdown(subject, "Subject3", subject3),
            FormDropdown(timings, "Flexible Timings",time1),
            FormDropdown(timings, "Flexible Timings",time2),*/
            SizedBox(
              height: screenHeight(context, dividedBy: 38),
            ),
            if (name.text != null && email.text != null)
              Button(
                text: "Submit",
                onpressed: () {
                  print(subject1);
                  print(time1);
                  print(grade);
                  var firebaseUser = FirebaseAuth.instance.currentUser;
                  firestoreInstance
                      .collection("users")
                      .doc(firebaseUser.uid)
                      .set({
                    "name": name.text,
                    "fname": fname.text,
                    "mname": mname.text,
                    "school": school.text,
                    "alternatemobile": alnernatemobile.text,
                    "contactno": firebaseUser.phoneNumber,
                    "email": email.text,
                    "subject1": subject1,
                    "subject2": subject2,
                    "subject3": subject3,
                    "time1": time1,
                    "time2": time2,
                    "grade": grade
                  });/**/
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
