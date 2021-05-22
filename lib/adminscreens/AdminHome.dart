import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:mymasterje/google%20meet/calendar_client.dart';
import 'package:mymasterje/screens/Complaints.dart';
import 'package:mymasterje/screens/DoubtForums.dart';
import 'package:mymasterje/screens/Notes.dart';
import 'package:mymasterje/screens/SocialMedia.dart';
import 'package:mymasterje/screens/Splash.dart';
import 'package:mymasterje/studentscreens/StudentProfile.dart';
import 'package:mymasterje/view.dart';
import 'package:googleapis/calendar/v3.dart' as cal;
import 'package:url_launcher/url_launcher.dart';
import '../secret.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void prompt(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer:Drawer(
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
            //         MaterialPageRoute(builder: (context) => StudentProfile()));
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
                        builder: (context) => UnderDevelopment()));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(text: "Schedule Meeting",
              onpressed: () async{
                var _clientID = new ClientId(Secret.getId(), "");
                const _scopes = const [cal.CalendarApi.calendarScope];
                await clientViaUserConsent(_clientID, _scopes, prompt)
                    .then((AuthClient client) async {
                  CalendarClient.calendar = cal.CalendarApi(client);
                });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectStudentScreen()));
            },),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("NOTE:\n\nDear Admin,\n\nKindly follow the following steps before scheduling the class:\n\n"
                  "i)Verify the payment details with the profile on the database provided on the Google Sheets\n\n"
                  "ii)Verify the subjects with the student.\n\n"
                  "iii)Verify the availability of teachers.\n\n"
                  "iv)Ensure that the student has downloaded the Google Meet and instruct them that they can join the class via the app and also via the link that they have recieved in their Email bu simply clicking on it."
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
      ),
    );
  }
}
