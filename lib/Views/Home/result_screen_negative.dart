import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:drug_scan_app/Core/Constants/colors.dart';

class ResultScreenIsNegative extends StatelessWidget {
  const ResultScreenIsNegative({
    super.key,
    required this.result,
  });
  final String result;

   Future<void> _saveAnalysisResult() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
       final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      final userName = userDoc.data()?['username'] ?? user.displayName ?? 'Unknown User';

      await FirebaseFirestore.instance.collection('analysis_results').add({
        'userId': user.uid,
        'userName': userName, 
        'userEmail': user.email,
        'result': result,
        'timestamp': FieldValue.serverTimestamp(), 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

     _saveAnalysisResult();

    return Scaffold(
      backgroundColor: kveryWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h * .15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Your Result is".tr,
                  style: GoogleFonts.lora(
                      color: kPrimary,
                      fontSize: w * .07,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  result,
                  style: GoogleFonts.lora(
                      color: kPrimary,
                      fontSize: w * .08,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: h * .06,
            ),
            Icon(
              Icons.check_circle_outline,
              color: kPrimary,
              size: w * .7,
            ),
            SizedBox(
              width: w,
              height: h * .4,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  " Please go to the Student Affairs Department to complete the remaining procedures."
                      .tr,
                  style: GoogleFonts.lora(
                      color: kRed,
                      fontSize: w * .06,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: h * .01,
            ),
          ],
        ),
      ),
    );
  }
}