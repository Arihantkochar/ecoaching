import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/screens/pdfview.dart';
import 'package:mymasterje/styles/themes.dart';

import 'Loading.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  var firestoreInstance = FirebaseFirestore.instance;
  int i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Results"),
        ),
        body: StreamBuilder(
            stream: firestoreInstance.collection('results').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Loading();
              else
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      for (int i = 0; i < snapshot.data.docs.length; i++)
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: lightTheme.primaryColorLight)),
                          child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => pdfview(
                                            snapshot.data.docs[i]['link'],
                                            snapshot.data.docs[i]['title'])));
                              },
                              title: Text(snapshot.data.docs[i]['title']),
                              subtitle: Text("Uploaded by:" +
                                  snapshot.data.docs[i]['name']),
                              trailing:
                              InkWell(onTap: (){
                                //TODO download pdf
                                // Directory appDocDirectory = await getApplicationDocumentsDirectory();
                                // Directory(appDocDirectory.path+'/'+'dir').create(recursive: true)
                                //     .then((Directory directory) async {
                                //   await dio.download(snapshot.data.docs[i]['link'], directory.path);
                                // });
                              },
                                  child: Icon(Icons.download_rounded))),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
            }));
  }
}
