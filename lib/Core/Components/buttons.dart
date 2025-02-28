// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.color,
    required this.text,
  });
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * .07,
      width: w * .43,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(25), color: color),
      child: Center(
        child: Text(text,
            style: GoogleFonts.aBeeZee(
                color: kveryWhite,
                fontSize: w * .06,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
