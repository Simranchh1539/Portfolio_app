import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_app/app_bar_pages/Education.dart';
import 'package:portfolio_app/app_bar_pages/projects.dart';

import '../app_bar_pages/about.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controllertab;
  @override
  void initState() {
    super.initState();
    controllertab = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showWarning(BuildContext context) async => showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Do You really want to exit'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', ModalRoute.withName('/home')),
                child: Text("Yes"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text("No"),
              ),
            ],
          ),
        );
    return WillPopScope(
      onWillPop: () async {
        final shouldpop = await showWarning(context);

        return shouldpop ?? false;
      },
      child: Scaffold(
          appBar: AppBar(
            // ignore: prefer_const_constructors
            title: Text('Portfolio: Way to manage records'),
            bottom: TabBar(
              controller: controllertab,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                Tab(
                  text: 'About',
                  icon: Icon(Icons.home),
                ),
                Tab(
                  text: 'Education',
                  icon: Icon(FontAwesomeIcons.bookOpen),
                ),
                Tab(
                  text: 'Projects',
                  icon: Icon(Icons.laptop_chromebook),
                ),
              ],
            ),

            //backgroundColor: Colors.pink[200],
          ),
          drawer: const Drawer(),
          body: TabBarView(
            controller: controllertab,
            children: [
              AboutPage(),
              Education(),
              Projects(),
            ],
          )),
    );
  }
}
