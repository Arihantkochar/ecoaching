import 'package:flutter/material.dart';

Size screenSize(BuildContext context) {
  return MediaQuery
      .of(context)
      .size;
}

double screenHeight(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).height / dividedBy;
}

double screenWidth(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).width / dividedBy;
}

List<String> gradelist = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12'
];
List<String> subject = [
  'English',
  'Hindi',
  'Mathematics',
  'Physics',
  'Chemistry',
  'Biology',
  'Computer Science',
  'General Science',
  'Social Studies',
  'History',
  'Civics',
  'Geography'
];
List<String> syllabus = ["CBSE", "ICSC", "State Board", "IGCSE", "IB"];
List<String> state = [
  "Delhi",
  "Haryana",
  "Punjab",
  "Uttarakhand",
  "Jammu and Kashmir",
  "Himachal Pradesh",
  "Uttar Pradesh",
  "Andhra Pradesh",
  "Karnataka",
  "Kerala",
  "Tamil Nadu",
  "Telangana",
  "west Bengal",
  "Odisha",
  "Jharkhand",
  "Bihar",
  "Sikkim",
  "Chattisgarh",
  "Goa",
  "Gujrat",
  "Maharashtra"
];