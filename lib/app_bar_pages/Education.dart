// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_app/dialouge_boxes/dialouge_add.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../model/details.dart';

class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  //late final QueryDocumentSnapshot documentID;
  var firestoredb =
      FirebaseFirestore.instance.collection("portfolio").snapshots();
  List<details> userlist = [];

  @override
  Widget build(BuildContext context) {
    var namecontroller = TextEditingController();
    var sessioncontroller = TextEditingController();
    var markscontroller = TextEditingController();
    // ignore: prefer_typing_uninitialized_variables
    final docId = "";
    void showaddDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Dialougeadd(docId),
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
                                children: [
                                  Container(
                                    width: 150,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/portfolio2.jpeg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 30),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  Text(
                                    snapshot.data.docs[index]['name'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    snapshot.data.docs[index]['session'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    snapshot.data.docs[index]['marks'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    snapshot.data.docs[index]['Options'],
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
                                          content: Dialougeadd(docId),
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
                                        .collection("portfolio");
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
