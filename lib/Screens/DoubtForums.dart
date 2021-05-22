import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/view.dart';

class DoubtForums extends StatefulWidget {
  @override
  _DoubtForumsState createState() => _DoubtForumsState();
}

class _DoubtForumsState extends State<DoubtForums> {
  var firebaseInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  TextEditingController doubt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doubt Forum"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight(context,dividedBy: 20),),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                "Hi,\n\nWe are glad that you are intrigued and want answers to all your questions. So here we are, the team of MyMasterje, to provide solutions to all your doubts. Kindly let us know what your doubt is and to whom your doubt is addressed to. Our team members will reach out to shortly and assist you with 1 on 1 doubt clarification session if and when required!\n\n\nThank you and Regards,"),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 20),
            child: Text("Team MyMasterje",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: doubt,
              decoration: InputDecoration(
                hintText: "What is your doubt? Please let us help you!",
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
                firebaseInstance.collection('doubts').doc().set({
                  "doubt":doubt.text,
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
