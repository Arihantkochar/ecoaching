import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mymasterje/Screens/Loading.dart';
import 'package:mymasterje/adminscreens/select_teachers_screen.dart';
import 'package:mymasterje/styles/themes.dart';

import '../view.dart';

class SelectStudentScreen extends StatefulWidget {
  @override
  _SelectStudentScreenState createState() => _SelectStudentScreenState();
}

class _SelectStudentScreenState extends State<SelectStudentScreen> {
  bool _checkbox = false;
  bool _checkboxListTile = false;
  //List _checkboxList = List.generate(100, (index) => false);
  List _checkboxList = [];
  List <String>selectedmember =[];
  List <String>uid = [];
  TextEditingController _searchController = TextEditingController();

  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Students"),
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
                  .where('role', isEqualTo: 'student')
                  .snapshots(),
              builder: (context, snapshot) {
                print(FirebaseFirestore.instance
                    .collection('users')
                    .where('role', isEqualTo: 'student')
                    .where('name', isEqualTo: _searchController.text)
                    .snapshots()
                    .length);
                // print("length $snapshot.data.docs.length");
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
                                            isEqualTo: 'student',
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
                                  for(int i=0;i<snapshot.data.docs.length;i++)
                                    _checkboxList.add(false);
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
                                                 //value: _checkboxListTile,
                                                value: _checkboxList[i],
                                                onChanged: (value) {
                                                  uid.add(snapshot.data.docs[i].id);
                                                  selectedmember.add(snapshot.data.docs[i]['email']);
                                                  print("Emails........$selectedmember");
                                                  print("hiiiiiiiiii ${snapshot.data.docs[i].id}");
                                                  setState(() {
                                                    _checkboxList[i] = !_checkboxList[i];
                                                  });
                                                  // print(
                                                  //     "After: $i ${_checkboxList[i]}");
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
                                                      selectedmember.add(snapshot.data.docs[i]['email']);
                                                      print("Emails........$selectedmember");
                                                      // print(
                                                      //     "Before: $i ${_checkboxList[i]}");
                                                      setState(() {
                                                       // _checkbox = !_checkbox;
                                                        _checkboxList[i] =
                                                            !_checkboxList[i];
                                                        // _checkboxListTile = !_checkboxListTile;
                                                      });
                                                      // print(
                                                      //     "After: $i ${_checkboxList[i]}");
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
                                            SelectTeacherScreen(selectedmember,uid)));
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
