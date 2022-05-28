import 'package:flutter/material.dart';

class bodySearch extends StatefulWidget {
  const bodySearch({Key? key}) : super(key: key);
  @override
  _bodySearchState createState() => _bodySearchState();
}

class _bodySearchState extends State<bodySearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Search Page'),
      ),
    );
  }
}
