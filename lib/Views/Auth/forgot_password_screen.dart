import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kveryWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Enter your email to reset password'),
          CustomTextField(
              hintcolor: kveryWhite,
              filledcolor: kPrimary,
              iconColor: kveryWhite,
              hintText: "Enter your email",
              keyboardType: TextInputType.emailAddress,
              icon: Icons.email_outlined)
        ],
      ),
    );
  }
}
