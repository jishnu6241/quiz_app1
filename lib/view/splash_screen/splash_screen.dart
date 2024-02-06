import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/view/question_screen/second.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => QnsQuiz(context),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int a = 10;
    return Scaffold(
      body: Center(
          child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: const Image(
          image: NetworkImage(
            'https://gshelper.com/wp-content/uploads/2017/09/Quiz-Logo.png',
          ),
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}
