import 'package:flutter/material.dart';
import 'package:task/Home.dart';
import 'package:task/all_posts_screen.dart';
import 'package:task/login_Screen.dart';
import 'package:task/profile_screen.dart';
import 'package:task/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
    
  }
}
