import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Views/Auth/login_screen.dart';
import 'package:drug_scan_app/Widgets/custom_button.dart';
import 'package:drug_scan_app/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSignupContainer extends StatelessWidget {
  const CustomSignupContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Center(
        child: Container(
          height: h * .7,
          width: w,
          decoration: BoxDecoration(
              color: kPrimary, borderRadius: BorderRadius.circular(18)),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const CustomTextField(
                hintcolor: kBlack,
                filledcolor: kveryWhite,
                icon: Icons.person,
                hintText: 'Enter your username',
                iconColor: kPrimary,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: h * .05),
              const CustomTextField(
                hintcolor: kBlack,
                filledcolor: kveryWhite,
                icon: Icons.mail_outline_outlined,
                hintText: 'Enter your email',
                iconColor: kPrimary,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: h * .05),
              const CustomTextField(
                hintcolor: kBlack,
                filledcolor: kveryWhite,
                icon: Icons.phone,
                hintText: 'Enter your phone',
                iconColor: kPrimary,
                keyboardType: TextInputType.number,
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
              SizedBox(
                height: h * .06,
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
                              builder: (context) => const LoginScreen()));
                    },
                    child: Text(
                      "Already have an account ? Login",
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
                height: h * .03,
              ),
              const CustomButton(text: 'Sign up'),
              SizedBox(
                height: h * .03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
