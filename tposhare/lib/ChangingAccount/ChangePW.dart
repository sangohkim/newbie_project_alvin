import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChangePW extends StatefulWidget {
  ChangePW({Key? key}) : super(key: key);
  @override
  State<ChangePW> createState() => _ChangePWState();
}

class _ChangePWState extends State<ChangePW> {
  String newPW = '';

  void changePW(String target) async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      await user?.updatePassword(newPW);
    } catch (e) {
      print(e);
      Navigator.pop(context);
      FirebaseAuth.instance.signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '변경할 패스워드를 입력해주세요\n*로그인 후 오랜시간이 지난경우 로그야웃처리될 수 있습니다',
      ),
      content: TextFormField(
        key: ValueKey(8),
        decoration: InputDecoration(
          labelText: 'new password',
        ),
        onSaved: (value) {
          newPW = value!;
        },
        onChanged: (value) {
          newPW = value;
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            changePW(newPW);
            Navigator.pop(context);
          },
          child: Text(
            'Apply',
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
