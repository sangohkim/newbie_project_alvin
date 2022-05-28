import 'package:flutter/material.dart';

class bodyHome extends StatefulWidget {
  const bodyHome({Key? key}) : super(key: key);

  @override
  _bodyHomeState createState() => _bodyHomeState();
}

class _bodyHomeState extends State<bodyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('home!')),
    );
  }
}
