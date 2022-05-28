import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class bodyMy extends StatefulWidget {
  const bodyMy({Key? key}) : super(key: key);
  @override
  _bodyMyState createState() => _bodyMyState();
}

class _bodyMyState extends State<bodyMy> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // Name, email address, and profile photo URL
    final name = user!.displayName;
    final email = user!.email;
    final photoUrl = user!.photoURL;

    // Check if user's email is verified
    final emailVerified = user!.emailVerified;

    // The user's ID, unique to the Firebase project. Do NOT use this value to
    // authenticate with your backend server, if you have one. Use
    // User.getIdToken() instead.
    final uid = user!.uid;
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // appBar의 그림자를 없애주는 것
        title: Text((email != null ? email.toString() : "null"),
            style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('MyPage'),
      ),
    );
  }
}
