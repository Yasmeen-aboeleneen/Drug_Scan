import 'package:flutter/material.dart';
import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCaptureButton extends StatelessWidget {
  const CustomCaptureButton({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [kPrimary2, kPrimary3],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: h * .07,
        width: w * .45,
        decoration: BoxDecoration(
          color: kveryWhite,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: GoogleFonts.aBeeZee(
                color: kPrimary,
                fontWeight: FontWeight.bold,
                fontSize: w * .049,
              ),
            ),
            Icon(
              icon,
              color: kPrimary,
              size: h * .04,
            ),
          ],
        ),
      ),
    );
  }
}
