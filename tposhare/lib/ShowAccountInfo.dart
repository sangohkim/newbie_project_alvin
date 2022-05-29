import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String? userName = '';
String? userEmail = '';

class ShowAccountInfo extends StatelessWidget {
  ShowAccountInfo({Key? key}) : super(key: key);

  final _authentication = FirebaseAuth.instance;
  User? loggerUser;

  @override
  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggerUser = user;
        userEmail = loggerUser!.email;
        final userCollectionReference =
            FirebaseFirestore.instance.collection('user').doc(loggerUser!.uid);
        userCollectionReference.get().then((value) {
          userName = value.data()!['userName'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    getCurrentUser();
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          'Account Info',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      content: Container(
        height: 80,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$userName',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$userEmail',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Text(
              'Close',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
