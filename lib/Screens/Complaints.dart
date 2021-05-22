import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/styles/common.dart';
import 'package:mymasterje/Widgets/Button.dart';
class Complaints extends StatefulWidget {
  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  TextEditingController complaint = TextEditingController();
  var firebaseInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grievances and Complaints"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight(context,dividedBy: 20),),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                "Hi,\n\nWe are extremely apologetic that you have faced some sort of an inconvenience which was totally unintentional and we are here to deliver the best experience to out patrons. We request you to lets us know as to what went wrong and out team will get back to as earliest.Kindly do the needful!\n\n\nThank you and Regards,"),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 20),
            child: Text("Team MyMasterje",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: complaint,
              decoration: InputDecoration(
                hintText: "Please tell us what went wrong...",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 8,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Button(
              text: "SEND",
              onpressed: () {
               firebaseInstance.collection('complaints').doc().set({
                 "complaint":complaint.text,
                 "uid":firebaseUser.uid,
                 "mobile":firebaseUser.phoneNumber
               });
               Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
