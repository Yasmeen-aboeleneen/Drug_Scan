// ignore_for_file: use_build_context_synchronously

import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Views/Auth/auth.dart';
import 'package:drug_scan_app/Views/Auth/forgot_password_screen.dart';
import 'package:drug_scan_app/Views/Auth/sign_up_screen.dart';
import 'package:drug_scan_app/Widgets/custom_button.dart';
import 'package:drug_scan_app/Widgets/custom_password_field.dart';
import 'package:drug_scan_app/Widgets/custom_social_button.dart';
import 'package:drug_scan_app/Widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomLoginContainer extends StatefulWidget {
  const CustomLoginContainer({super.key});

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
            hintText: 'Enter User Name',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SocialmediaRow(
                image: "Assets/google.jpg",
                text: "Google",
                ontap: signInWithGoogle,
              ),
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
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // الانتقال إلى الشاشة الرئيسية عند نجاح تسجيل الدخول
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Auth()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'wrong-password') {
        errorMessage = 'كلمة المرور غير صحيحة.';
      } else if (e.code == 'user-not-found') {
        errorMessage = 'البريد الإلكتروني غير مسجل.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'صيغة البريد الإلكتروني غير صحيحة.';
      } else if (e.code == 'too-many-requests') {
        errorMessage =
            'تم حظر محاولات تسجيل الدخول مؤقتاً بسبب محاولات عديدة خاطئة.';
      } else {
        errorMessage = 'حدث خطأ: ${e.message}';
      }

      // عرض رسالة الخطأ
      if (!mounted) return;
      showErrorDialog(context, errorMessage);
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('خطأ'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('حسناً'),
            ),
          ],
        );
      },
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw FirebaseAuthException(
            code: 'sign-in-cancelled', message: 'تم إلغاء تسجيل الدخول.');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // التحقق من وجود البريد الإلكتروني مسبقًا
      final email = googleUser.email;
      final signInMethods =
          // ignore: deprecated_member_use
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      if (signInMethods.isEmpty) {
        // البريد الإلكتروني غير مسجل مسبقًا
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("حساب غير مسجل"),
              content: Text(
                  "البريد الإلكتروني الخاص بك غير مسجل. يرجى إنشاء حساب جديد."),
            );
          },
        );
        return; // إيقاف العملية هنا
      }

      // تسجيل الدخول باستخدام بيانات الاعتماد
      await FirebaseAuth.instance.signInWithCredential(credential);

      // الانتقال إلى صفحة Auth بعد تسجيل الدخول بنجاح
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Auth()),
      );
    } on FirebaseAuthException catch (e) {
      // التعامل مع الأخطاء الخاصة بـ FirebaseAuthException
      showErrorDialog(context, e.message ?? 'حدث خطأ أثناء تسجيل الدخول.');
    } catch (e) {
      // التعامل مع أي أخطاء أخرى
      showErrorDialog(context, 'حدث خطأ أثناء تسجيل الدخول باستخدام Google.');
    }
  }
}
