import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Loading.dart';

class SchoolList extends StatefulWidget {
  @override
  _SchoolListState createState() => _SchoolListState();
}

class _SchoolListState extends State<SchoolList> {
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registered Schools & Colleges"),),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: firestoreInstance.collection('users').where('role',whereIn: ['college','school']).snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData)
              return Loading();
            return Column(
              children: [
                for(int i = 0;i< snapshot.data.docs.length;i++)
                  ListTile(
                    title: Text(snapshot.data.docs[i]['schoolname']),
                    subtitle: Text(snapshot.data.docs[i]['address']),
                  )
              ],
            );
          }
        ),
      ),
    );
  }
}
