import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/Screens/Loading.dart';
import 'package:mymasterje/google%20meet/screens/dashboard_screen.dart';
import 'package:mymasterje/styles/themes.dart';

import '../view.dart';

class SelectTeacherScreen extends StatefulWidget {
  @override
  _SelectTeacherScreenState createState() => _SelectTeacherScreenState();
}

class _SelectTeacherScreenState extends State<SelectTeacherScreen> {

  List _checkboxList = List.generate(100, (index) => false);
  TextEditingController _searchController = TextEditingController();

  String name = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Teachers"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where('role', isEqualTo: 'teacher')
                  .snapshots(),
              builder: (context, snapshot) {
                print(FirebaseFirestore.instance
                    .collection('users')
                    .where('role', isEqualTo: 'teacher')
                    .where('name', isEqualTo: _searchController.text)
                    .snapshots()
                    .length);
                // print("length $snapshot.data.docs.length");
                print(_checkboxList);
                print("_______");
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? Loading()
                    : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: lightTheme.primaryColorLight)),
                        child: TextField(
                          controller: _searchController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search...'),
                          onSubmitted: (val) {
                            setState(() {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .where('role',
                                  isEqualTo: 'teacher',
                                  arrayContains: 'name')
                                  .where('name',
                                  isEqualTo: _searchController)
                                  .snapshots();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, i) {
                            return _searchController.text == ''
                                ? Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: lightTheme
                                          .primaryColorLight)),
                              child: ListTile(
                                  onTap: () {},
                                  title: Text(snapshot.data.docs[i]
                                  ['name']),
                                  subtitle: Text(snapshot
                                      .data.docs[i]['email']),
                                  trailing: Checkbox(
                                    // value: _checkboxListTile,
                                    value: _checkboxList[i],
                                    onChanged: (value) {

                                      setState(() {
                                        _checkboxList[i] =
                                        !_checkboxList[i];
                                        // _checkboxListTile = !_checkboxListTile;
                                      });

                                    },
                                  )),
                            )
                                : snapshot.data.docs[i]['name'] ==
                                _searchController.text
                                ? Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: lightTheme
                                          .primaryColorLight)),
                              child: ListTile(
                                  onTap: () {},
                                  title: Text(snapshot
                                      .data.docs[i]['name']),
                                  subtitle: Text(snapshot
                                      .data.docs[i]['email']),
                                  trailing: Checkbox(
                                    // value: _checkboxListTile,
                                    value: _checkboxList[i],
                                    onChanged: (value) {

                                      setState(() {
                                        _checkboxList[i] =
                                        !_checkboxList[i];

                                      });

                                    },
                                  )),
                            )
                                : Container();
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Button(
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DashboardScreen()));
                        },
                        text: "Next",
                      ),
                    )
                  ],
                );
              }),
        ));
  }
}
