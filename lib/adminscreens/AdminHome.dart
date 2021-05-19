import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:mymasterje/google%20meet/calendar_client.dart';
import 'package:mymasterje/screens/Notes.dart';
import 'package:mymasterje/screens/Splash.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child:
            Text("Header")),
            ListTile(
              title: Text("Contact Us"),
              onTap: (){
                //TODO Contact us
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
          Button(
            text: "Logout",
              onpressed: () async {
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
          ],
        ),
      ),
    );
  }
}
