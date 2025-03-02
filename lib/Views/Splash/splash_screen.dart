// ignore_for_file: prefer_const_constructors

import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Views/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kveryWhite,
      body: Stack(children: [
        Positioned(
            top: 10,
            left: 10,
            child: Image.asset(
              'Assets/ImageHandler.png',
              width: w * .3,
              height: h * .2,
            )),
        Positioned(
            top: 10,
            right: 10,
            child: Image.asset(
              'Assets/logo-sefac.jpg',
              width: w * .3,
              height: h * .2,
            )),
        Positioned(
          bottom: h * .36,
          left: w * .08,
          right: w * .08,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: child,
              );
            },
            child: Image.asset(
              'Assets/pic.png',
              width: w * .75,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            bottom: h * .13,
            left: w * .05,
            right: w * .05,
            child: Column(
              children: [
                Text(
                  'Prepared by :',
                  style: GoogleFonts.hammersmithOne(
                      color: kBlack,
                      fontSize: w * .045,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: h * .02,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Dr. Wessam Mohammad Kamal ElSaid',
                  style: GoogleFonts.hammersmithOne(
                      color: kBlue,
                      fontSize: w * .045,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Assistant Professor of Computer Science',
                  style: GoogleFonts.hammersmithOne(
                      color: kBlue,
                      fontSize: w * .045,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Mansoura University ',
                  style: GoogleFonts.hammersmithOne(
                      color: kBlue,
                      fontSize: w * .045,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: h * .02,
                ),
              ],
            ))
      ]),
    );
  }
}
