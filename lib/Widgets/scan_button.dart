import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:drug_scan_app/Core/Constants/colors.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 15, left: 15),
      height: h * .06,
      width: w * .5,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: kPrimary),
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              colors: [kPrimary2, kPrimary2, kPrimary3, kPrimary3])),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.aBeeZee(
              color: kveryWhite,
              fontSize: w * .059,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
