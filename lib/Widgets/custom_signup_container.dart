import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Views/Auth/login_screen.dart';
import 'package:drug_scan_app/Widgets/custom_button.dart';
import 'package:drug_scan_app/Widgets/custom_password_field.dart';
import 'package:drug_scan_app/Widgets/custom_social_button.dart';
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
          height: h * .75,
          width: w,
          decoration: BoxDecoration(
              color: kPrimary, borderRadius: BorderRadius.circular(18)),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
           CustomTextField(
                hintcolor: kBlack,
                filledcolor: kveryWhite,
                icon: Icons.person,
                hintText: 'Enter your username',
                iconColor: kPrimary,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: h * .04),
              CustomTextField(
                hintcolor: kBlack,
                filledcolor: kveryWhite,
                icon: Icons.mail_outline_outlined,
                hintText: 'Enter your email',
                iconColor: kPrimary,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: h * .04),
                CustomTextField(
                hintcolor: kBlack,
                filledcolor: kveryWhite,
                icon: Icons.phone,
                hintText: 'Enter your phone',
                iconColor: kPrimary,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: h * .04),
              const CustomPasswordtextfield(),
              SizedBox(
                height: h * .03,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 35, right: 35),
                child: CustomButton(text: 'Sign up'),
              ),
              SizedBox(
                height: h * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      color: kveryWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Or Sign up with",
                      style: GoogleFonts.notoSans(
                        color: kveryWhite,
                        fontSize: w * .04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: kveryWhite,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * .01,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialmediaRow(image: "Assets/google.jpg", text: "Google"),
                  SocialmediaRow(image: "Assets/facebook.png", text: "Facebook")
                ],
              ),
              SizedBox(
                height: h * .02,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Align(
                  alignment: Alignment.center,
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
            ],
          ),
        ),
      ),
    );
  }
}
