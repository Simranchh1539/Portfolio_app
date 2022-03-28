// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'login.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              // ignore: duplicate_ignore
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/portfolio.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: "PORTFOLIO\n",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      TextSpan(
                        text: "Make Your Work Easy and Paperless",
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ])),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Start Exploring",
                            style: Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
