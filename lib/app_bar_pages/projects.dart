// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_app/dialouge_boxes/dialouge_project.dart';

import '../model/details.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  //late final QueryDocumentSnapshot documentID;
  var firestoredb =
      FirebaseFirestore.instance.collection("Projects").snapshots();
  List<details> userlist = [];

  @override
  Widget build(BuildContext context) {
    var namecontroller = TextEditingController();
    var startcontroller = TextEditingController();
    var endcontroller = TextEditingController();
    // ignore: prefer_typing_uninitialized_variables
    final docId = "";
    void showaddDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: DialougeProject(docId),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showaddDialog,
        child: Icon(Icons.add),
      ),
      body: Container(
        //height: 400,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
            stream: firestoredb,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    //scrollDirection: Axis.horizontal,
                    // shrinkWrap: false,

                    child: Column(
                      children: [
                        Container(
                          width: 700,
                          //height: double.maxFinite,
                          //color: Colors.black26,
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border: Border.all(color: Colors.black38)),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Text("Name : ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      Text(
                                        snapshot.data.docs[index]['name'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Start Date : ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data.docs[index]['startdate'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "End Date : ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data.docs[index]['enddate'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.edit,
                                    size: 20,
                                    color: Colors.deepPurple,
                                  ),
                                  onPressed: () async {
                                    var docId = snapshot.data.docs[index].id;
                                    showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          content: DialougeProject(docId),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                          ),
                                        );
                                      },
                                    );
                                  }),
                              IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.trashAlt,
                                    size: 20,
                                    color: Colors.deepPurple,
                                  ),
                                  onPressed: () async {
                                    var docId = snapshot.data.docs[index].id;
                                    var CollectionReference = FirebaseFirestore
                                        .instance
                                        .collection("Projects");
                                    await CollectionReference.doc(docId)
                                        .delete();
                                  })
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: (snapshot.data as QuerySnapshot).docs.length,
              );
            }),
      ),
    );
  }
}
