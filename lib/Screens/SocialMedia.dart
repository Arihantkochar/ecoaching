import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatefulWidget {
  @override
  _SocialMediaState createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  Widget socialmediabutton(String url,String logo,double scale) =>  Center(
    child: InkWell(
        onTap: () async{
          await launch(url);
        },
        child: Image.asset("assets/images/${logo}",scale: scale,)
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Media"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        socialmediabutton("https://www.facebook.com/My-Masterje-Educating-India-101273952163072","Facebook.png",3),
          socialmediabutton("https://www.linkedin.com/in/my-masterje-educating-india-607765212","LinkedIn Logo.png",10),
          socialmediabutton("https://instagram.com/mymasterje?utm_medium=copy_link","Instagram Logo.png",8),
          SizedBox(height: 20,),
          socialmediabutton("https://www.youtube.com/channel/UC9m-v9mGQrkjN_NI4SEbONw","Youtube Logo.png",14),
        ],
      ),
    );
  }
}
