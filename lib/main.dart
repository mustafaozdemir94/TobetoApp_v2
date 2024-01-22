import 'package:flutter/material.dart';
import 'package:tobetoappclone/screens/login_screen.dart';
import 'package:tobetoappclone/screens/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      //home: const SplashScreen(),
    ),
  );
}
