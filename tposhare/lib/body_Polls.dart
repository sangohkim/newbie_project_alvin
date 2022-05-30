import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class bodyPolls extends StatefulWidget {
  bodyPolls({Key? key}) : super(key: key);
  @override
  State<bodyPolls> createState() => _bodyPollsState();
}

class _bodyPollsState extends State<bodyPolls> {
  @override
  var userImage;

  String? userTime;
  String? userPlace;
  String? userOccasion;

  final _authentication = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'TPOSHARE',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check_outlined, color: Colors.blue, size: 35),
            onPressed: () async {
              // Firestore 데이터 저장을 위해 비동기 방식
              // 이미지와 텍스트가 유효한지 확인하는 코드
              if (userImage == null ||
                  userTime!.isEmpty ||
                  userPlace!.isEmpty ||
                  userOccasion!.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('All forms must be filled'),
                    backgroundColor: Colors.orange,
                  ),
                );
              } else {
                // 모든 입력이 유효할 때(나중에 추가하기)
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image나오는 컨테이너
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color.fromARGB(255, 220, 217, 217),
                  width: 3,
                ),
              ),
              height: MediaQuery.of(context).size.width - 10,
              width: MediaQuery.of(context).size.width - 10,
              child: userImage == null
                  ? Center(child: Text('No image'))
                  : Image.file(userImage),
            ),
            // 갤러리, 카메라 버튼 나오는 컨테이너
            Container(
              width: MediaQuery.of(context).size.width - 10,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.photo_album_outlined,
                      size: 40,
                      color: Colors.blue,
                    ),
                    onPressed: () async {
                      var picker = ImagePicker();
                      var image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        setState(() {
                          userImage = File(image.path);
                        });
                      } else {
                        setState(() {
                          userImage = null;
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.photo_camera_back,
                      size: 40,
                      color: Colors.blue,
                    ),
                    onPressed: () async {
                      var picker = ImagePicker();
                      var image =
                          await picker.pickImage(source: ImageSource.camera);
                      if (image != null) {
                        setState(() {
                          userImage = File(image.path);
                        });
                      } else {
                        setState(() {
                          userImage = null;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            // TPO입력하는 칸
            Container(
              width: MediaQuery.of(context).size.width - 10,
              height: 350,
              child: Column(
                children: [
                  TextFormField(
                    key: ValueKey(11),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Contents should exists';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Time?',
                    ),
                    onSaved: (value) {
                      userTime = value!;
                    },
                    onChanged: (value) {
                      userTime = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    key: ValueKey(12),
                    decoration: InputDecoration(
                      labelText: 'Place?',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Contents should exists';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userPlace = value!;
                    },
                    onChanged: (value) {
                      userPlace = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    key: ValueKey(13),
                    decoration: InputDecoration(
                      labelText: 'Occasion?',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Contents should exists';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userOccasion = value!;
                    },
                    onChanged: (value) {
                      userOccasion = value;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
