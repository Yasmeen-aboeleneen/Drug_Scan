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
      final userName =
          userDoc.data()?['username'] ?? user.displayName ?? 'Unknown User';

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
              height: h * .12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Your Result is".tr,
                    style: GoogleFonts.aBeeZee(
                        color: kPrimary,
                        fontSize: w * .07,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    result,
                    style: GoogleFonts.aBeeZee(
                        color: kPrimary,
                        fontSize: w * .08,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * .055,
            ),
            SizedBox(
              height: h * .4,
              child: Center(
                child: Icon(
                  Icons.check_circle_outline,
                  color: kPrimary,
                  size: w * .75,
                ),
              ),
            ),
            SizedBox(
              width: w,
              height: h * .3,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  " Please go to the Student Affairs Department to complete the remaining procedures"
                      .tr,
                  style: GoogleFonts.aBeeZee(
                      color: kRed,
                      fontSize: w * .06,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: h * .12,
            ),
          ],
        ),
      ),
    );
  }
}
