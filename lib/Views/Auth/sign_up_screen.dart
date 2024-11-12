import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Widgets/custom_signup_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kveryWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: h * .045),
            Row(
              children: [
                Image.asset(
                  'Assets/pic.png',
                  width: w * .4,
                ),
                Text(
                  "Sign Up To Drug Scan",
                  style: GoogleFonts.notoSans(
                      color: kPrimary,
                      fontSize: w * .05,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const CustomSignupContainer(),
            SizedBox(
              height: h * .03,
            )
          ],
        ),
      ),
    );
  }
}
