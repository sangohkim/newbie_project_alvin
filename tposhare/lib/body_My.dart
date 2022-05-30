import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tposhare/Settings.dart';
import 'package:tposhare/ShowAccountInfo.dart';
import 'package:tposhare/MyActivities/MyPosts.dart';
import 'package:tposhare/MyActivities/MyLikes.dart';
import 'package:tposhare/MyActivities/MyScraps.dart';

class bodyMy extends StatefulWidget {
  const bodyMy({Key? key}) : super(key: key);
  @override
  _bodyMyState createState() => _bodyMyState();
}

String? userName = '';
String? userEmail = '';

class _bodyMyState extends State<bodyMy> {
  final _authentication = FirebaseAuth.instance;
  User? loggerUser;

  final List<String> accountList = <String>['회원정보조회', '설정'];
  final List<IconData> accountListIcon = <IconData>[
    Icons.account_circle_outlined,
    Icons.settings_outlined
  ];

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggerUser = user;
        userEmail = loggerUser!.email;
        final userCollectionReference =
            FirebaseFirestore.instance.collection('user').doc(user.uid);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TPOSHARE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return mySettings();
                    },
                  ),
                );
              },
              color: Colors.white,
              iconSize: 30),
        ],
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // 검은 바탕 화면
            Container(
              height: 270,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Container(
                margin: EdgeInsets.only(top: 80, left: 15),
                child: Text(
                  key: ValueKey(10),
                  '${userName!}',
                  style: TextStyle(
                    fontSize: 50, // 나중에 ID 길이 제한도 만들기!
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // 여백
            Container(
              height: 15,
              color: Colors.white,
            ),
            // '내 활동'
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width - 15,
              child: Text(
                '내 활동',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 버튼과 글씨
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.history_outlined),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MyPosts();
                              },
                            ),
                          );
                        },
                      ),
                      Text(
                        '내 글',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up_outlined),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MyLikes();
                              },
                            ),
                          );
                        },
                        color: Colors.black,
                      ),
                      Text(
                        '내 좋아요',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.star_border_outlined),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MyScraps();
                              },
                            ),
                          );
                        },
                      ),
                      Text(
                        '내 스크랩',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 여백
            Container(
              height: 15,
              color: Colors.white,
            ),
            // 내 계정 정보 글씨
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width - 15,
              child: Text(
                '내 계정 정보',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 내 계정 정보 리스트
            Container(
              height: 200,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 10.0),
                itemCount: accountList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.black,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: Icon(
                        accountListIcon[index],
                        color: Colors.black,
                      ),
                      title: Text('${accountList[index]}'),
                      textColor: Colors.black,
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ShowAccountInfo();
                              },
                            ),
                          );
                        }
                        if (index == 1) {
                          // '설정'을 클릭했을 때
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return mySettings();
                              },
                            ),
                          );
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
