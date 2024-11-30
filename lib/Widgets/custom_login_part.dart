import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Views/Auth/forgot_password_screen.dart';
import 'package:drug_scan_app/Views/Auth/sign_up_screen.dart';
import 'package:drug_scan_app/Widgets/custom_button.dart';
import 'package:drug_scan_app/Widgets/custom_password_field.dart';
import 'package:drug_scan_app/Widgets/custom_social_button.dart';
import 'package:drug_scan_app/Widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLoginContainer extends StatefulWidget {
  CustomLoginContainer({super.key});

  @override
  State<CustomLoginContainer> createState() => _CustomLoginContainerState();
}

class _CustomLoginContainerState extends State<CustomLoginContainer> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
      child: Column(
        children: [
          SizedBox(height: h * .14),
          Text(
            'Login to Drug Scan',
            style: GoogleFonts.notoSans(
                color: kveryWhite,
                fontSize: w * .07,
                decorationColor: kveryWhite,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: h * .09),
          CustomTextField(
            controller: emailController,
            filledcolor: kveryWhite,
            icon: Icons.mail_outline_outlined,
            hintText: 'Enter your email',
            iconColor: kPrimary,
            keyboardType: TextInputType.emailAddress,
            hintcolor: kBlack,
          ),
          SizedBox(height: h * .05),
          CustomPasswordtextfield(
            controller: passwordController,
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
                          builder: (context) => const ForgotPasswordScreen()));
                },
                child: Text(
                  'Forgot password?',
                  style: GoogleFonts.notoSans(
                      color: kveryWhite,
                      fontSize: w * .038,
                      decorationColor: kveryWhite,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: h * .06,
          ),
          GestureDetector(
              onTap: signIN,
              child: const CustomButton(
                text: 'Login',
              )),
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
                  "Or login with",
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
            height: h * .02,
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
          Align(
            alignment: Alignment.center,
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
        ],
      ),
    );
  }

  Future signIN() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
