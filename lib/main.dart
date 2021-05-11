import 'package:flutter/material.dart';
import 'package:mymasterje/screens/ChooseProfession.dart';
import 'package:mymasterje/screens/Splash.dart';
import 'package:mymasterje/styles/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: SplashScreen(),
    );
  }
}
