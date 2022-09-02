import 'package:flutter/material.dart';
import './login_page.dart';
import './sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        SignUp.routname: (ctx) => SignUp(),
      },
    );
  }
}
