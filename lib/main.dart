
import 'package:flutter/material.dart';
import 'package:getx/demo/demo_screen.dart';
import 'package:getx/home%20screen.dart';
import 'package:getx/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}
