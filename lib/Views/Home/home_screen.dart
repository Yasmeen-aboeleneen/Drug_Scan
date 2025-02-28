import 'package:drug_scan_app/Core/Constants/colors.dart';

import 'package:drug_scan_app/Widgets/custom_app_bar.dart';
import 'package:drug_scan_app/Widgets/custom_bottom_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kveryWhite,
        body: Stack(
          children: [
            Positioned(top: 0, left: 0, right: 0, child: CustomAppBar()),
            Positioned(
                bottom: 0, left: 0, right: 0, child: CustomBottomContainer())
          ],
        ),
      ),
    );
  }
}
