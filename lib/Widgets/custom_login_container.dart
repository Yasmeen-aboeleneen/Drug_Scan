import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Views/Auth/forgot_password_screen.dart';
import 'package:drug_scan_app/Views/Auth/sign_up_screen.dart';
import 'package:drug_scan_app/Widgets/custom_button.dart';
import 'package:drug_scan_app/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLoginContainer extends StatelessWidget {
  const CustomLoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
      child: Center(
        child: Container(
          height: h * .56,
          width: w,
          decoration: BoxDecoration(
              color: kPrimary, borderRadius: BorderRadius.circular(18)),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: h * .05),
              const CustomTextField(
                filledcolor: kveryWhite,
                icon: Icons.mail_outline_outlined,
                hintText: 'Enter your email',
                iconColor: kPrimary,
                keyboardType: TextInputType.emailAddress, hintcolor: kBlack,
              ),
              SizedBox(height: h * .05),
              const CustomTextField(
                hintcolor: kBlack,
                filledcolor: kveryWhite,
                icon: Icons.lock_outline,
                hintText: 'Enter your password',
                iconColor: kPrimary,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: h * .02),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen()));
                    },
                    child: Text(
                      'Forgot password?',
                      style: GoogleFonts.notoSans(
                          color: kveryWhite,
                          fontSize: w * .038,
                          decoration: TextDecoration.underline,
                          decorationColor: kveryWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * .06,
              ),
              const CustomButton(text: 'Login'),
              SizedBox(
                height: h * .03,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: Text(
                      "Don't have an account ? Sign up",
                      style: GoogleFonts.notoSans(
                          color: kveryWhite,
                          fontSize: w * .038,
                          decoration: TextDecoration.underline,
                          decorationColor: kveryWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
