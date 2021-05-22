import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/screens/Complaints.dart';
import 'package:mymasterje/screens/DoubtForums.dart';
import 'package:mymasterje/screens/SchoolList.dart';
import 'package:mymasterje/screens/SocialMedia.dart';
import 'package:mymasterje/screens/Splash.dart';
import 'package:mymasterje/utils/UnderDevelopment.dart';
import 'package:mymasterje/widgets/Button.dart';


class SchoolHome extends StatefulWidget {
  @override
  _SchoolHomeState createState() => _SchoolHomeState();
}

class _SchoolHomeState extends State<SchoolHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MY MASTERJE"),),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(height: 20,),
            // ListTile(
            //   title: Text("Profile",style: TextStyle(
            //       color: Theme.of(context).primaryColorLight,
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold),),
            //   trailing: Icon(Icons.person,color: Theme.of(context).primaryColorLight,),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => UnderDevelopment()));
            //   },
            // ),
            // ListTile(
            //   title: Text("E-Library",style: TextStyle(
            //       color: Theme.of(context).primaryColorLight,
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold),),
            //   trailing: Icon(Icons.library_books_sharp,color: Theme.of(context).primaryColorLight,),
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => Notes()));
            //   },
            // ),
            // ListTile(
            //   title: Text("Results",style: TextStyle(
            //       color: Theme.of(context).primaryColorLight,
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold),),
            //   trailing: Icon(Icons.receipt_sharp,color: Theme.of(context).primaryColorLight,),
            //   onTap: (){
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => Results()));
            //   },
            // ),
            ListTile(
              title: Text("Test Series",style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.chat,color: Theme.of(context).primaryColorLight,),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UnderDevelopment()));
              },
            ),
            ListTile(
              title: Text("Grievances and Complaints ",style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.grid_off_sharp,color: Theme.of(context).primaryColorLight,),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Complaints()));
              },
            ),
            ListTile(
              title: Text("Doubt Forum",style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.forum,color: Theme.of(context).primaryColorLight,),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoubtForums()));
              },
            ),
            ListTile(
              title: Text("Certificates and Trainings",style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.model_training,color: Theme.of(context).primaryColorLight,),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UnderDevelopment()));
              },
            ),
            ListTile(
              title: Text("Social Media",style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.perm_media,color: Theme.of(context).primaryColorLight,),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SocialMedia()));
              },
            ),
            ListTile(
              title: Text("Payment Gateway",style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.payments_sharp,color: Theme.of(context).primaryColorLight,),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UnderDevelopment()));
              },
            ),
            ListTile(
              title: Text("Covid Support",style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.coronavirus,color: Theme.of(context).primaryColorLight,),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UnderDevelopment()));
              },
            ),
            ListTile(
              title: Text(
                "Contact Us",
                style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.call,color: Theme.of(context).primaryColorLight,),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UnderDevelopment()));
              },
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Button(
                text: "Logout",
                onpressed: () async {
                  await _auth.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                },
              ),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Button(text:"School And College List",
            onpressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SchoolList()));
            },),
          )
        ],
      ),
    );
  }
}
