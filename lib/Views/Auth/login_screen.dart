import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimary,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h * .05),
            Center(
              child: Text(
                "Login To Drug Scan",
                style: GoogleFonts.notoSans(
                    color: kveryWhite,
                    fontSize: w * .05,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: h * .05),
            const CustomTextField(
              icon: Icons.mail_outline,
              hintText: 'enter your email',
              iconColor: kPrimary,
              keyboardType: TextInputType.emailAddress,
              maxLen: 50,
            ),
            SizedBox(height: h * .05),
            const CustomTextField(
              icon: Icons.lock_outline,
              hintText: 'enter your password',
              iconColor: kPrimary,
              keyboardType: TextInputType.text,
              maxLen: 50,
            )
          ],
        ),
      )),
    );
  }
}
