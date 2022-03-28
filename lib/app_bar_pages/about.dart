import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: const AssetImage("assets/avator.jpg"),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Johen Day",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 30),
                    child: Text(
                      "Andriod Developer | Front End Developer",
                      style: TextStyle(
                        color: Colors.deepPurple.shade300,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    //child: Text("About Me"),
                    child: Column(children: <Widget>[
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          // ignore: prefer_const_constructors
                          Text("My Details",
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: [
                            Column(
                              children: <Widget>[
                                Icon(Icons.email_outlined),
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(Icons.phone),
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(FontAwesomeIcons.linkedin),
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(FontAwesomeIcons.laptop),
                                SizedBox(width: 10),
                              ],
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "simranchabbra789@gmail.com",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "9876589659",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("simranchabbra1539",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Web:Css,java,js | App:Flutter",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
