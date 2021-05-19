import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/screens/Notes.dart';
import 'package:mymasterje/screens/Splash.dart';
import 'package:mymasterje/techerscreens/TeacherProfile.dart';
import 'package:mymasterje/techerscreens/UploadPdf.dart';
import 'package:mymasterje/widgets/Button.dart';


class TeacherHome extends StatefulWidget {
  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child:
            Text("Profile")),
            ListTile(
              title: Text("Profile"),
              onTap: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeacherProfile()));
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
              title: Text("Contact Us"),
              onTap: (){
                //TODO Contact us
              },
            ),
           Button(
             text: "Logout",
             onpressed: () async{
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Button(text: "Upload Notes",
            onpressed: (){
              //TODO UPLOAD pdf
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UploadPdf()));
            },),
          ),

          // Button(text: "Join Meeting",
          // onpressed: (){
          //
          // },)
        ],
      ),
    );
  }
}
