import 'package:firebase_core/firebase_core.dart';
import 'package:quizine/challenge/challenge_page.dart';
import 'package:quizine/home/home_page.dart';
import 'package:quizine/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizine/home/home_page.dart';
import 'package:quizine/login/login.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    return MaterialApp(title: "quizine", home: LoginPage());
  }
}
