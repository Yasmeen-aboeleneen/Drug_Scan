import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * .4,
      width: w,
      decoration: const BoxDecoration(
        color: kveryWhite,
      ),
      child: Center(
        child: Text(
          'Upload your medical\n examination result',
          style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.w700, fontSize: w * .08, color: kPrimary),
        ),
      ),
    );
  }
}
