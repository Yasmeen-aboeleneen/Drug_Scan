// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Views/Auth/auth.dart';
import 'package:drug_scan_app/Views/Auth/login_screen.dart';
import 'package:drug_scan_app/Widgets/custom_button.dart';
import 'package:drug_scan_app/Widgets/custom_password_field.dart';
import 'package:drug_scan_app/Widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSignupContainer extends StatefulWidget {
  const CustomSignupContainer({super.key});

  @override
  State<CustomSignupContainer> createState() => _CustomSignupContainerState();
}

class _CustomSignupContainerState extends State<CustomSignupContainer> {
  final username = TextEditingController();
  final emailController = TextEditingController();
  final parentemailController = TextEditingController();
  final phoneNumber = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    emailController.dispose();
    parentemailController.dispose();
    phoneNumber.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isValidPhoneNumber(String phoneNumber) {
    final RegExp phoneRegExp = RegExp(r'^(010|011|012|015)\d{8}$');
    return phoneRegExp.hasMatch(phoneNumber);
  }

  Future<void> signUp() async {
  try {
    // التحقق من صحة رقم الهاتف
    if (!isValidPhoneNumber(phoneNumber.text.trim())) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Invalid Phone Number",
              style: TextStyle(color: kPrimary, fontSize: 15),
            ),
            content: const Text('رقم الهاتف المدخل غير صالح. يرجى إدخال رقم صحيح.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // إنشاء حساب المستخدم باستخدام FirebaseAuth
    final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // تحديث ملف المستخدم بإضافة displayName (اختياري)
    await userCredential.user?.updateProfile(displayName: username.text.trim());

    // حفظ بيانات المستخدم في Firestore
    await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
      'username': username.text.trim(), // اسم المستخدم
      'email': emailController.text.trim(), // البريد الإلكتروني
      'parentEmail': parentemailController.text.trim(), // بريد ولي الأمر
      'phoneNumber': phoneNumber.text.trim(), // رقم الهاتف
      'createdAt': FieldValue.serverTimestamp(), // وقت إنشاء الحساب
    });

    // الانتقال إلى الشاشة التالية
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Auth()),
    );
  } on FirebaseAuthException catch (e) {
    // معالجة الأخطاء
    if (e.code == 'email-already-in-use') {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Error",
              style: TextStyle(color: kPrimary, fontSize: 15),
            ),
            content: const Text('هذا البريد الإلكتروني مسجل مسبقاً'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text('${e.message}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}

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
                controller: username,
                hintcolor: kBlack,
                filledcolor: kveryWhite,
                icon: Icons.person,
                hintText: 'Enter your username',
                iconColor: kPrimary,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: h * .04),
              CustomTextField(
                controller: emailController,
                hintcolor: kBlack,
                filledcolor: kveryWhite,
                icon: Icons.mail_outline_outlined,
                hintText: 'Enter your email',
                iconColor: kPrimary,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: h * .04),
              CustomTextField(
                controller: parentemailController,
                hintcolor: kBlack,
                filledcolor: kveryWhite,
                icon: Icons.mail_outline_outlined,
                hintText: "Enter your parent's email",
                iconColor: kPrimary,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: h * .04),
              CustomTextField(
                controller: phoneNumber,
                hintcolor: kBlack,
                filledcolor: kveryWhite,
                icon: Icons.phone,
                hintText: 'Enter your phone',
                iconColor: kPrimary,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: h * .04),
              CustomPasswordtextfield(
                controller: passwordController,
              ),
              SizedBox(
                height: h * .03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: GestureDetector(
                    onTap: signUp, child: const CustomButton(text: 'Sign up')),
              ),
              SizedBox(
                height: h * .03,
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
