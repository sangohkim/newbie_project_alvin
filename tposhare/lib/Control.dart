import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/auth.dart';

import 'package:tposhare/body_My.dart';
import 'package:tposhare/body_Search.dart';
import 'package:tposhare/body_Polls.dart';
import 'package:tposhare/body_Done.dart';
import 'package:tposhare/body_Home.dart';

class Control extends StatefulWidget {
  const Control({Key? key}) : super(key: key);

  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  int _curIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    bodyHome(),
    bodySearch(),
    bodyPolls(),
    bodyDone(),
    bodyMy(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_curIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Polls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_outlined),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_rounded),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _curIndex,
      ),
    );
  }
}
