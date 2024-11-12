// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
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
      height: h * .053,
      width: w * .38,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              colors: [kPrimary2, kPrimary2, kPrimary3, kPrimary3])),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.aBeeZee(
              color: kveryWhite,
              fontSize: w * .055,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
