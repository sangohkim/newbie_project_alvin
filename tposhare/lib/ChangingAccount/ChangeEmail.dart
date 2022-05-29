import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChangeEmail extends StatefulWidget {
  ChangeEmail({Key? key}) : super(key: key);
  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  String newEmail = '';

  void changeEmail(String newAddress) async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      await user?.updateEmail(newAddress);
      final userName = FirebaseFirestore.instance
          .collection('user')
          .doc(user!.uid)
          .get()
          .then((value) {
        value.data()!['userName'];
      });
      FirebaseFirestore.instance.collection('user').doc(user!.uid).update({
        'userName': userName,
        'Email': newEmail,
      });
    } catch (e) {
      print(e);
      Navigator.pop(context);
      FirebaseAuth.instance.signOut();
    }
  }

  @override
  Widget build(BuildContext) {
    return AlertDialog(
      title: Text(
        '변경할 이메일 주소를 입력해주세요',
      ),
      content: TextFormField(
        key: ValueKey(7),
        decoration: InputDecoration(
          labelText: 'New Email Address',
        ),
        onSaved: (value) {
          newEmail = value!;
        },
        onChanged: (value) {
          newEmail = value;
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            '취소',
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            changeEmail(newEmail);
            Navigator.pop(context);
          },
          child: Text(
            '완료',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
