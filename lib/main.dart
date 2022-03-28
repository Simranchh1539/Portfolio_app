import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/main_pages/home.dart';
import 'package:portfolio_app/main_pages/login.dart';
import 'package:portfolio_app/main_pages/startup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: prefer_const_constructors
      home: StartPage(),
      routes: <String, WidgetBuilder>{
        '/start': (BuildContext context) => new StartPage(),
        '/login': (BuildContext context) => new Login(),
        '/home': (BuildContext context) => new HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // ignore: prefer_const_constructors
        textTheme: TextTheme(
          // ignore: prefer_const_constructors
          headline2: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
      ),

      //routes: {"/": (context) => Login(),},
    );
  }
}
