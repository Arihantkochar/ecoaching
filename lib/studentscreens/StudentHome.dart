import 'package:flutter/material.dart';
import 'package:mymasterje/screens/Notes.dart';
import 'package:mymasterje/studentscreens/StudentProfile.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Profile"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentProfile()));
              },
            ),
            ListTile(
              title: Text("Notes"),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Notes()));
              },
            ),
            ListTile(
              title: Text("Contact us"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentProfile()));
              },
            )
          ],
        ),
      ),
    );
  }
}
