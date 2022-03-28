// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _launchURL(String s) async {
    const String _url = 'https://flutter.dev';
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  bool statechange = false;
  String name = '';
  String pass = '';
  final _formkey = GlobalKey<FormState>();
  nextstage(BuildContext context) async {
    if (_formkey.currentState.validate()) {
      setState(() {
        statechange = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ));
      setState(() {
        statechange = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showWarning(BuildContext context) async => showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Do You really eant to exit'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text("Yes"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text("No"),
              ),
            ],
          ),
        );
    // ignore: avoid_unnecessary_containers
    return WillPopScope(
      onWillPop: () async {
        final shouldpop = await showWarning(context);

        return shouldpop ?? false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/portfolio2.jpeg"),
                    fit: BoxFit.cover,
                  )),
                )),
            Form(
              key: _formkey,
              child: Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 35),
                    child: SizedBox(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Sign In",
                                  style: Theme.of(context).textTheme.headline2),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("$name $pass",
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(Icons.alternate_email),
                                    ),
                                    Expanded(
                                        //flex: 3,
                                        child: TextFormField(
                                      onChanged: (value) {
                                        name = value;
                                        setState(() {});
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Email Can't be Empty";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Enter Email Address"),
                                    )),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Icon(Icons.lock),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      obscureText: true,
                                      onChanged: (value) {
                                        pass = value;
                                        setState(() {});
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Password Can't be Empty";
                                        } else if (value.length < 6) {
                                          return "Password Should be equal or more than 6 digits";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Enter Password"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  launch('https://www.facebook.com');
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black45),
                                  ),
                                  child:
                                      Icon(FontAwesomeIcons.facebook, size: 45),
                                ),
                              ),
                              SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {
                                  launch(
                                      'https://www.instagram.com/accounts/login');
                                },
                                child: Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black45),
                                  ),
                                  child: Icon(FontAwesomeIcons.instagramSquare,
                                      size: 35),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () => nextstage(context),
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 2),
                                  width: statechange ? 50 : 150,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: statechange
                                      ? Icon(Icons.done)
                                      : Text(
                                          "Sign in",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue[100],
                                    //shape: statechange
                                    //? BoxShape.circle
                                    //: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(
                                        statechange ? 40 : 8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
