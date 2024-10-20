import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: kveryWhite,
      body: Image.asset('Assets/pic.png'),
    );
  }
}