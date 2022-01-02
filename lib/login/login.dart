import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizine/core/core.dart';
import 'package:quizine/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:quizine/login/googleauth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  Future.delayed(Duration(seconds: 2)).then((_) => {
    //        Navigator.pushReplacement(
    //            context, MaterialPageRoute(builder: (context) => HomePage()))
    //      });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Column(children: [
          Image.asset(
            AppImages.logo,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
            icon: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.red,
            ),
            label: Text('Sign up with Google'),
            onPressed: () {
              signInWithGoogle(context);
            },
          )
        ]),
      ),
    );
  }
}
