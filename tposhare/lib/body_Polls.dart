import 'package:flutter/material.dart';

class bodyPolls extends StatefulWidget {
  const bodyPolls({Key? key}) : super(key: key);
  @override
  _bodyPollsState createState() => _bodyPollsState();
}

class _bodyPollsState extends State<bodyPolls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Polls Page!'),
      ),
    );
  }
}
