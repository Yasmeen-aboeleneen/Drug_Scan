import 'package:drug_scan_app/Core/Components/buttons.dart';
import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreenIsPositive extends StatelessWidget {
  const ResultScreenIsPositive({super.key, required this.result});
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
                      color: kRed,
                      fontSize: w * .08,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: h * .05,
            ),
            SizedBox(
              width: w,
              height: h * .4,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  " You must take the remedial course in order to be accepted into the college.",
                  style: GoogleFonts.lora(
                      color: kRed,
                      fontSize: w * .065,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: h * .03,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Buttons(color: kPrimary, text: "Send Us"),
                Buttons(color: kRed, text: "Ignore")
              ],
            )
          ],
        ),
      ),
    );
  }
}
