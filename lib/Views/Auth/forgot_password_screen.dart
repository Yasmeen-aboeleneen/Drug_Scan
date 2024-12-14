// ignore_for_file: use_build_context_synchronously

import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void resetPassword() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your email"),
          backgroundColor: kDGrey,
        ),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني"),
          backgroundColor: kPrimary,
        ),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "حدث خطأ. يرجى المحاولة مرة أخرى.";
      if (e.code == 'user-not-found') {
        errorMessage = "هذا البريد الإلكتروني غير مسجل.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: kRed,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kveryWhite),
        backgroundColor: kPrimary,
        centerTitle: true,
        title: Text(
          'Forgot Password',
          style: GoogleFonts.aBeeZee(
              color: kveryWhite,
              fontSize: w * .066,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: kwarm,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock_outline_sharp,
            color: kPrimary,
            size: w * .4,
          ),
          Text(
            textAlign: TextAlign.center,
            'Enter your email to reset password',
            style: GoogleFonts.aBeeZee(
                color: kDGrey, fontSize: w * .056, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: h * .05,
          ),
          CustomTextField(
            controller: emailController,
            hintcolor: kBlack,
            filledcolor: kveryWhite,
            icon: Icons.mail_outline_outlined,
            hintText: 'Enter your email',
            iconColor: kPrimary,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: h * .05,
          ),
          GestureDetector(
            onTap: resetPassword,
            child: Container(
              height: h * .06,
              width: w * .5,
              decoration: const BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: Text(
                  "Reset",
                  style: GoogleFonts.aBeeZee(
                      color: kveryWhite,
                      fontSize: w * .066,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
