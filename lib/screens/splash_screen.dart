import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tobetoappv2/screens/start.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String lottieSplashUrl = 'https://lottie.host/6c98c34f-2892-4595-a7fc-ed569d04324d/cXV6HKNNe4.json';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    var duration = const Duration(seconds: 4);
    Timer(duration, route);
  }

  void route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Lottie.network(lottieSplashUrl),
      ),
    );
  }
}
