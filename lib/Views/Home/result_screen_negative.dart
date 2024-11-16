// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:drug_scan_app/Core/Constants/colors.dart';

class ResultScreenIsNegative extends StatelessWidget {
  const ResultScreenIsNegative({
    super.key,
    required this.result,
  });
  final String result;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kveryWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h * .15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  Your Result is : ",
                  style: GoogleFonts.lora(
                      color: kPrimary,
                      fontSize: w * .07,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  result,
                  style: GoogleFonts.lora(
                      color: kPrimary,
                      fontSize: w * .08,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: h * .06,
            ),
            Icon(
              Icons.check_circle_outline,
              color: kPrimary,
              size: w * .7,
            ),
            SizedBox(
              width: w,
              height: h * .4,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  " Please go to the Student Affairs Department to complete the remaining procedures.",
                  style: GoogleFonts.lora(
                      color: kRed,
                      fontSize: w * .06,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: h * .01,
            ),
          ],
        ),
      ),
    );
  }
}
