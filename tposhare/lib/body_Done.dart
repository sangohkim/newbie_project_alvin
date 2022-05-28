import 'package:flutter/material.dart';

class bodyDone extends StatefulWidget {
  const bodyDone({Key? key}) : super(key: key);
  @override
  _bodyDoneState createState() => _bodyDoneState();
}

class _bodyDoneState extends State<bodyDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Done Page!'),
      ),
    );
  }
}
