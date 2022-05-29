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
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'TPOSHARE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
