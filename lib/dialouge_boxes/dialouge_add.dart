import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Dialougeadd extends StatefulWidget {
  final docId;
  Dialougeadd(this.docId);

  @override
  _DialougeaddState createState() => _DialougeaddState(docId);
}

class _DialougeaddState extends State<Dialougeadd> {
  final docId;
  _DialougeaddState(this.docId);
  var firestoredb =
      FirebaseFirestore.instance.collection("portfolio").snapshots();

  @override
  Widget build(BuildContext context) {
    var namecontroller = TextEditingController();
    var sessioncontroller = TextEditingController();
    var markscontroller = TextEditingController();
    var optioncontroller = TextEditingController();
    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            // ignore: prefer_const_constructors
            border: OutlineInputBorder(
              // ignore: prefer_const_constructors
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
          controller: controller,
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(8),
      height: 300,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Text(
              'Add Qualification',
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            buildTextField('Name', namecontroller),
            buildTextField('Session', sessioncontroller),
            buildTextField('Percentage', markscontroller),
            buildTextField('Options', optioncontroller),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection("portfolio").add({
                      "name": namecontroller.text,
                      "session": sessioncontroller.text,
                      "marks": markscontroller.text,
                      "Options": optioncontroller.text,
                    });

                    Navigator.of(context).pop();
                  },
                  child: Text('Add New'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("portfolio")
                        .doc(docId)
                        .update({
                      "name": namecontroller.text,
                      "session": sessioncontroller.text,
                      "marks": markscontroller.text,
                      "Options": optioncontroller.text,
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Update'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
