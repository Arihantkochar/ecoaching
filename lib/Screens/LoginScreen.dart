import 'package:flutter/material.dart';
import 'package:mymasterje/widgets/Login.dart';
import 'package:mymasterje/utils/LoginBackground.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          Login(),
        ],
      ),
    );
  }
}
