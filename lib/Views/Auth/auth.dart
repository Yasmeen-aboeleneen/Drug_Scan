import 'package:drug_scan_app/Views/Auth/login_screen.dart';
import 'package:drug_scan_app/Views/Splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return const SplashScreen();
            } else {
              return const LoginScreen();
            }
          })),
    );
  }
}
