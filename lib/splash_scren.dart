import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nav/login_view.dart';
import 'package:nav/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final colorP = const Color.fromARGB(253, 26, 0, 131);
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          // builder: (context) => const Home(
          //   title: 'Flutter',
          // ),
          builder: (context) => const LoginView(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.white,
        color: colorP,
        child: Center(
          child: Image.asset(
            'images/logo.jpeg',
            width: 340,
          ),
        ),
      ),
    );
  }
}
