import 'package:flutter/material.dart';
import 'package:mymasterje/styles/common.dart';

Widget WelcomeScreenCard(context,String image,String text) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenSize(context).height * 0.2,
        width: screenSize(context).width * 0.4,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                    height: screenSize(context).height * 0.14,
                    child: Image.asset(image)),
                Text(
                  text,
                  style: TextStyle(fontSize: 25),
                )
              ],
            )),
      ),
    );
