import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/screens/Complaints.dart';
import 'package:mymasterje/screens/DoubtForums.dart';
import 'package:mymasterje/screens/Notes.dart';
import 'package:mymasterje/screens/Results.dart';
import 'package:mymasterje/screens/SocialMedia.dart';
import 'package:mymasterje/screens/Splash.dart';
import 'package:mymasterje/studentscreens/StudentProfile.dart';
import 'package:mymasterje/utils/UnderDevelopment.dart';
import 'package:mymasterje/widgets/Button.dart';


class ParentHome extends StatefulWidget {
  @override
  _ParentHomeState createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY MASTERJE"),
      ),
      drawer:  Drawer(
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
            ListTile(
              title: Text("E-Library",style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.library_books_sharp,color: Theme.of(context).primaryColorLight,),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Notes()));
              },
            ),
            ListTile(
              title: Text("Results",style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.receipt_sharp,color: Theme.of(context).primaryColorLight,),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Results()));
              },
            ),
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
            child: Button(text: "View Results",
              onpressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Results()));
              },),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("NOTE: \n\nDear Parent,\nWe, the team of MyMasterje are happy to have you on board. Kindly explore the best courses on MyMasterje as shown and enroll for them before the seats fill out and give your children, the best of quality education."),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("ENROLL NOW!",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Parents can now get a 1 on 1 counseling session scheduled with the administrators and teachers by putting out all the details on the doubt forum in the menu and wait for our admin staff to get back to you."),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("-MyMasterje",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }
}
