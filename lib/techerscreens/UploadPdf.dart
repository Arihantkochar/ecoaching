import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/view.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

import 'TeacherHome.dart';



class UploadPdf extends StatefulWidget {
  @override
  _UploadPdfState createState() => _UploadPdfState();
}

class _UploadPdfState extends State<UploadPdf> {
  TextEditingController title = TextEditingController();
  TextEditingController name = TextEditingController();
  io.File file;
  UploadTask task;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  var firestoreInstance = FirebaseFirestore.instance;

  getname() async {
    await firestoreInstance.collection('users').doc(firebaseUser.uid).get().then((value) {
      return value.data()['name'];
    });
  }

  //Future<String> url;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Upload PDF"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("NOTE:Only PDFs can be uploaded.",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
            controller: title,
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Uploaded by:',
            ),
            controller: name,
          ),
          SizedBox(height: 5,),
          Button(
            text: "Upload PDF",
            onpressed: () async{
              try {
                FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: false);
                if(result != null) {
                final path  = result.files.single.path;
                setState(() {
                   file = io.File(path);
                });
                final ref = FirebaseStorage.instance.ref(title.text);
               task =  ref.putFile(file);

               final snapshot = await task.whenComplete(() {

               });
                final url = await snapshot.ref.getDownloadURL();
             task.whenComplete(() {
               FirebaseFirestore.instance.collection('pdf').doc().set({
                 "title":title.text,
                 "link":url,
                 "name":name.text
               });
               Navigator.pushReplacement(context,
                   MaterialPageRoute(builder: (context) => TeacherHome()));
             });

                //     .whenComplete(() {
                //   setState(() {
                //     url = ref.getDownloadURL();
                //   });
                //   FirebaseFirestore.instance.collection('pdf').doc().set({
                //     "title":title.text,
                //     "link":url
                //   });
                //   Navigator.pushReplacement(context,
                //       MaterialPageRoute(builder: (context) => TeacherHome()));
                //
                // } );
                } else {
                  // User canceled the picker
                  Navigator.pop(context);
                }
                // File file = await FilePicker.(type: FileType.custom);
               // String filename = title.text + '.pdf';
               // var url = await savePdf(file.readAsBytesSync(), filename);
                //print(url);
                //return url;
              } catch (e) {
                print(e.toString());
              }
            },
          ),
          SizedBox(height: 10,),
          Text("Please Wait after uploading the video once\nuploaded, screen will be navigated to Home")
        ],
      ),
    );
  }
}
