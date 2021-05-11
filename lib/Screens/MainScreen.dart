import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mymasterje/main.dart';
import '../styles/themes.dart';
import '../styles/common.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColorDark,
        child: Column(
          children: [
            Container(

              child: Center(
                child: Text(
                  "WELCOME",
                  style: GoogleFonts.fredokaOne(fontSize: 50,color: Colors.white),
                ),
              ),
              height: screenSize(context).height * 0.30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35), topLeft: Radius.circular(35)),
              child: Container(
                color: Theme.of(context).primaryColorLight,
                height: screenSize(context).height * 0.70,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Text("I am a?",style: TextStyle(color: Colors.white,fontSize: 45),),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: screenSize(context).height * 0.2,
                              width: screenSize(context).width * 0.4,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 8,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                          height:screenSize(context).height * 0.14,
                                          child:
                                          Image.asset("assets/student.jpg")),
                                      Text('Student',style: TextStyle(fontSize: 25),)
                                    ],
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: screenSize(context).height * 0.2,
                              width: screenSize(context).width * 0.4,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 8,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                        height:screenSize(context).height * 0.14,
                                          child:
                                              Image.asset("assets/parent.jpg")),
                                      Text('Parent',style: TextStyle(fontSize: 25),)
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: screenSize(context).height * 0.2,
                              width: screenSize(context).width * 0.4,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 8,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                          height:screenSize(context).height * 0.14,
                                          child:
                                          Image.asset("assets/teacher.jpg")),
                                      Text('Teacher',style: TextStyle(fontSize: 25),)
                                    ],
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: screenSize(context).height * 0.2,
                              width: screenSize(context).width * 0.4,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 8,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                          height:screenSize(context).height * 0.14,
                                          child:
                                          Image.asset("assets/admin.jpg")),
                                      Text('Admin',style: TextStyle(fontSize: 25),)
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
