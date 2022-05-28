import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:tposhare/Control.dart';

class LoginSignUpScreen extends StatefulWidget {
  LoginSignUpScreen({Key? key}) : super(key: key);
  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool isSignUpScreen = true; // state 관리를 위해서 만든 변수
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 윗 배경
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              color: Color.fromARGB(255, 53, 49, 49),
              // 나중에 decoration 넣기
              child: Container(
                padding: EdgeInsets.only(
                  top: 130,
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Welcome to,',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: ' TPOSHARE!',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      isSignUpScreen
                          ? 'Signup to continue....'
                          : 'Signin to continue....',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // TextFormField
          Positioned(
            top: 260,
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width -
                  40, // 기기의 종류에 무관하게 적용하기 위한 코드
              margin:
                  EdgeInsets.symmetric(horizontal: 20.0), // 좌우로 20픽셀 씩 여백을 준다
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 7,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignUpScreen = false;
                          });
                        },
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: !isSignUpScreen
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            if (!isSignUpScreen) // inline if 기능을 이용한 것
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: !isSignUpScreen
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignUpScreen = true;
                          });
                        },
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'SIGNUP',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:
                                    isSignUpScreen ? Colors.black : Colors.grey,
                              ),
                            ),
                            if (isSignUpScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color:
                                    isSignUpScreen ? Colors.black : Colors.grey,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (isSignUpScreen)
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_outlined),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  // 해당 Textfield가 선택되었을 때 border line을 보여주는 역할을 한다
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                hintText: 'Username',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  // 해당 Textfield가 선택되었을 때 border line을 보여주는 역할을 한다
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                hintText: 'Email',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password_outlined),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  // 해당 Textfield가 선택되었을 때 border line을 보여주는 역할을 한다
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                hintText: 'Password',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!isSignUpScreen)
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_outlined),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  // 해당 Textfield가 선택되었을 때 border line을 보여주는 역할을 한다
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                hintText: 'Username',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password_outlined),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  // 해당 Textfield가 선택되었을 때 border line을 보여주는 역할을 한다
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                hintText: 'Password',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          // Button
          Positioned(
            top: 560,
            left: 160,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 53, 49, 49),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Container(
                child: Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
