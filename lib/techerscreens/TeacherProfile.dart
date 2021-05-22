import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/screens/Loading.dart';
import 'package:mymasterje/styles/common.dart';
import 'package:mymasterje/techerscreens/TeacherHome.dart';
import 'package:mymasterje/widgets/Button.dart';

class TeacherProfile extends StatefulWidget {
  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  var firebaseInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  TextEditingController contactno = TextEditingController(text: "");
  TextEditingController alternatecontactno = TextEditingController(text: "");
  TextEditingController email = TextEditingController(text: "");
  TextEditingController grade = TextEditingController(text: "");
  TextEditingController subject1 = TextEditingController(text: "");
  TextEditingController subject2 = TextEditingController(text: "");
  TextEditingController subject3 = TextEditingController(text: "");
  Widget editabletextfield(String hinttext, String label, TextEditingController controller) =>
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
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: firebaseInstance
                .collection('users')
                .doc(firebaseUser.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Loading();
              return Container(
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
                          height: screenSize(context).height * 1.2,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: SingleChildScrollView(
                                child: Container(
                                  height: screenHeight(context) * 1.8,
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
                                        editabletextfield(
                                            snapshot.data['subject1'], "Subject Proficiency 1", subject1),
                                        editabletextfield(
                                            snapshot.data['subject2'], "Subject Proficiency 2", subject2),
                                        editabletextfield(
                                            snapshot.data['subject3'], "Subject Proficiency 3", subject3,),
                                        SizedBox(height: 20,),
                                        Button(
                                          text: "SAVE",
                                          onpressed: () {
                                            print("Save clicked");
                                            firebaseInstance
                                                .collection('users')
                                                .doc(firebaseUser.uid)
                                                .update({
                                              "contactno": contactno.text == ""?snapshot.data['contactno']:contactno.text,
                                              "alternatemobile": alternatecontactno.text == ""?snapshot.data['alternatemobile']:alternatecontactno.text,
                                              "email": email.text == ""?snapshot.data['email']:email.text,
                                              "grade": grade.text == ""?snapshot.data['grade']:grade.text,
                                              "subject1": subject1.text == ""?snapshot.data['subject1']:subject2.text,
                                              "subject2": subject2.text == ""?snapshot.data['subject2']:subject2.text,
                                              "subject3": subject3.text == ""?snapshot.data['subject3']:subject3.text,
                                            }).then((_) {
                                              print("success!");
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TeacherHome()));
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
