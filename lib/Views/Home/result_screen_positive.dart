import 'package:drug_scan_app/Core/Components/buttons.dart';
import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Core/Utils/notification_helper.dart';
import 'package:drug_scan_app/Views/Home/prescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResultScreenIsPositive extends StatelessWidget {
  const ResultScreenIsPositive({
    super.key,
    required this.result,
    required this.detectedDrug,
  });
  final String result;
  final String detectedDrug;

  // دالة لتحويل أول حرف إلى حرف كبير
  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  Future<void> _saveAnalysisResult() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        final userName =
            userDoc.data()?['username'] ?? user.displayName ?? 'Unknown User';

        await FirebaseFirestore.instance.collection('analysis_results').add({
          'userId': user.uid,
          'userName': userName,
          'userEmail': user.email,
          'result': result,
          'detectedDrug': detectedDrug,
          'timestamp': FieldValue.serverTimestamp(),
        });

        Get.snackbar(
          'Success',
          'Analysis result saved successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save analysis result: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> requestExactAlarmPermission(BuildContext context) async {
    if (Platform.isAndroid) {
      final status = await Permission.notification.request();
      if (status.isDenied) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Permission denied! Please enable notification permissions.'),
          ),
        );
      }
    }
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Exit Application'.tr,
          style: GoogleFonts.aBeeZee(
            color: kRed,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        content: Text(
          'Are you sure you want to exit?'.tr,
          style: GoogleFonts.aBeeZee(
            color: kPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel'.tr,
              style: GoogleFonts.aBeeZee(
                color: kPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else {
                exit(0);
              }
            },
            child: Text(
              'Exit'.tr,
              style: GoogleFonts.aBeeZee(
                color: kRed,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleScheduleNotification(BuildContext context) async {
    await requestExactAlarmPermission(context);
    scheduleFollowUpNotification();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    _saveAnalysisResult();

    // تحويل أول حرف من detectedDrug إلى حرف كبير
    final capitalizedDrug = capitalizeFirstLetter(detectedDrug);

    return Scaffold(
      backgroundColor: kveryWhite,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: h * .15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Your Result is".tr,
                  style: GoogleFonts.aBeeZee(
                    color: kPrimary,
                    fontSize: w * .067,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  result,
                  style: GoogleFonts.aBeeZee(
                    color: kRed,
                    fontSize: w * .067,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: h * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  " Detected Drug : ".tr,
                  style: GoogleFonts.aBeeZee(
                    color: kPrimary,
                    fontSize: w * .06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  capitalizedDrug,
                  style: GoogleFonts.aBeeZee(
                    color: kRed,
                    fontSize: w * .06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: h * .05),
            SizedBox(
              width: w,
              height: h * .4,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "You Must Take a 14-Day Drug Treatment Course and Retake The Drug Screen Again"
                      .tr,
                  style: GoogleFonts.aBeeZee(
                    color: kRed,
                    fontSize: w * .065,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: h * .03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Prescription(),
                      ),
                    );
                    handleScheduleNotification(context);
                  },
                  child: Buttons(color: kPrimary, text: "Prescription".tr),
                ),
                GestureDetector(
                  onTap: () => _showExitDialog(context),
                  child: Buttons(color: kRed, text: "Exit".tr),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
