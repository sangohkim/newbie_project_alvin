import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChangeID extends StatefulWidget {
  ChangeID({Key? key}) : super(key: key);
  @override
  State<ChangeID> createState() => _ChangeIDState();
}

class _ChangeIDState extends State<ChangeID> {
  final _authentication = FirebaseAuth.instance;
  String newID = '';

  @override
  void initState() {
    super.initState();
  }

  void changeID(String target) {
    final user = _authentication.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .update({'userName': newID, 'userEmail': user.email});
    }
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '변경할 userName을 입력해주세요',
        style: TextStyle(),
      ),
      content: TextFormField(
        key: const ValueKey(6),
        onSaved: (value) {
          newID = value!;
        },
        onChanged: (value) {
          newID = value;
        },
        validator: (value) {
          if (value!.isEmpty || value.length < 4) {
            return 'Please enter more than 4 characters';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'New userName',
        ),
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
            changeID(newID);
            Navigator.pop(context);
          },
          child: Text(
            '적용',
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
