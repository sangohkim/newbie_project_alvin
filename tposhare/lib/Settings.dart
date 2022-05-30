import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tposhare/ChangingAccount/ChangeID.dart';
import 'package:tposhare/ChangingAccount/ChangeEmail.dart';
import 'package:tposhare/ChangingAccount/ChangePW.dart';

class mySettings extends StatelessWidget {
  final settingList = <String>['아이디 변경', '이메일 변경', '비밀번호 변경'];
  final settingList1 = <IconData>[
    Icons.account_circle_outlined,
    Icons.mail_outlined,
    Icons.password_outlined
  ];
  final settingList2 = <String>['로그아웃', '회원탈퇴'];
  final settingList2Icon = <IconData>[
    Icons.logout_outlined,
    Icons.delete_forever_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // 이전 화면으로 돌아가기
          },
        ),
        title: Text(
          '설정',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 8.0),
              itemCount: settingList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.black,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ChangeID();
                        }),
                      );
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChangeEmail();
                          },
                        ),
                      );
                    } else if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChangePW();
                          },
                        ),
                      );
                    }
                  },
                  leading: Icon(
                    settingList1[index],
                    color: Colors.black,
                  ),
                  title: Text('${settingList[index]}'),
                  textColor: Colors.black,
                );
              },
            ),
          ),
          Container(
            color: Color.fromARGB(255, 236, 233, 233),
            height: 15,
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 8.0),
              itemCount: settingList2.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.black,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(settingList2Icon[index], color: Colors.black),
                  title: Text('${settingList2[index]}'),
                  textColor: Colors.red,
                  onTap: () async {
                    if (index == 0) {
                      Navigator.pop(context);
                      FirebaseAuth.instance.signOut();
                    } else if (index == 1) {
                      Navigator.pop(context);
                      final user = FirebaseAuth.instance.currentUser;
                      await FirebaseFirestore.instance
                          .collection('user')
                          .doc(user!.uid)
                          .delete();
                      await user.delete();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
