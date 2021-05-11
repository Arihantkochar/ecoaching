import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mymasterje/widgets/WelcomeScreenCard.dart';
import '../styles/common.dart';

class ChooseProfession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(

              child: Center(
                child: Text(
                  "WELCOME",
                  style: GoogleFonts.fredokaOne(fontSize: 50,color: Colors.black),
                ),
              ),
              height: screenSize(context).height * 0.30,
            ),
            SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35), topLeft: Radius.circular(35)),
                 child: Container(
                  color: Theme.of(context).primaryColorLight,
                  height: screenSize(context).height * 0.70,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Are You A?",style: TextStyle(color: Colors.black,fontSize: 45),),
                          Row(
                            children: [
                             WelcomeScreenCard(context,'assets/images/student.png', "Student"),
                            WelcomeScreenCard(context, 'assets/images/parent.png', "Parent")
                            ],
                          ),
                          Row(
                            children: [
                             WelcomeScreenCard(context, "assets/images/teacher.png", "Teacher"),
                             WelcomeScreenCard(context, "assets/images/admin.png", "Admin")
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Image.asset("assets/images/school.png",scale: 5,),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Image.asset("assets/images/college.png",scale: 5,),
                             ),
                            ],
                          )
                        ],
                      ),
                    ),
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
