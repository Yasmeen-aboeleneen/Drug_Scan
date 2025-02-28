import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Views/Lang/language_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * .35,
      width: w,
      decoration: const BoxDecoration(
        color: kveryWhite,
      ),
      child: Stack(
        children: [
          Positioned(
            top: h * .04,
            left: w * .03,
            child: IconButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(kPrimary)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LanguageScreen()));
                },
                icon: const Icon(
                  Icons.language_outlined,
                  color: kveryWhite,
                )),
          ),
          Positioned(
            bottom: h * .01,
            left: w * .01,
            right: w * .01,
            child: Image.asset(
              'Assets/logo.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
