import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:tposhare/Control.dart';
import 'package:tposhare/LoginSignUp.dart';

// Flutter에서 Firebase를 사용하려면 메인메서드에서 비동기 방식으로 WidgetsFlutterBinding.ensureInitialized()를 불러오고
// 그 후에 Firebase.initializeApp() 메서드를 불러와야 한다
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginSignUpScreen(),
    );
  }
}
