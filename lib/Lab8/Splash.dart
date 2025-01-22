import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labs/Lab8/birthdayCardHomePage.dart';
import 'package:labs/Lab8/birthdayCardPage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),(){
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewBirthdayCard()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/minion.jpg'))
    );
  }
}
