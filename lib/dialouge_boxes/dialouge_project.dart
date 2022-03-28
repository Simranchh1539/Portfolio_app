import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DialougeProject extends StatefulWidget {
  final docId;
  DialougeProject(this.docId);

  @override
  _DialougeProjectState createState() => _DialougeProjectState(docId);
}

class _DialougeProjectState extends State<DialougeProject> {
  final docId;
  _DialougeProjectState(this.docId);
  var firestoredb =
      FirebaseFirestore.instance.collection("Projects").snapshots();

  @override
  Widget build(BuildContext context) {
    var projectnamecontroller = TextEditingController();
    var startcontroller = TextEditingController();
    var endcontroller = TextEditingController();

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
              'Add Projects',
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            buildTextField(' Project Name', projectnamecontroller),
            buildTextField('Start Date', startcontroller),
            buildTextField('End Date', endcontroller),

            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection("Projects").add({
                      "name": projectnamecontroller.text,
                      "startdate": startcontroller.text,
                      "enddate": endcontroller.text,
                    });

                    Navigator.of(context).pop();
                  },
                  child: Text('Add New'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("Projects")
                        .doc(docId)
                        .update({
                      "name": projectnamecontroller.text,
                      "startdate": startcontroller.text,
                      "enddate": endcontroller.text,
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
