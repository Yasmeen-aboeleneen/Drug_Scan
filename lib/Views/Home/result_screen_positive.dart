import 'package:drug_scan_app/Core/Components/buttons.dart';
import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Core/Utils/notification_helper.dart';
import 'package:drug_scan_app/Views/Home/prescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class ResultScreenIsPositive extends StatelessWidget {
  const ResultScreenIsPositive({super.key, required this.result});
  final String result;


  Future<void> requestExactAlarmPermission(BuildContext context) async {
    if (Platform.isAndroid) {
      final status = await Permission.notification.request();
      if (status.isDenied) {
        // إذا تم رفض الإذن
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Permission denied! Please enable notification permissions.')),
        );
      }
    }
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Exit Application',
          style: GoogleFonts.aBeeZee(
            color: kRed,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        content: Text(
          'Are you sure you want to exit?',
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
              'Cancel',
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
              'Exit',
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
    return Scaffold(
      backgroundColor: kveryWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: h * .15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  Your Result is : ",
                  style: GoogleFonts.lora(
                    color: kPrimary,
                    fontSize: w * .07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  result,
                  style: GoogleFonts.lora(
                    color: kRed,
                    fontSize: w * .08,
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
                  "You must take the remedial course in order to be accepted into the college.",
                  style: GoogleFonts.lora(
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
                  child: const Buttons(color: kPrimary, text: "Prescription"),
                ),
                GestureDetector(
                  onTap: () => _showExitDialog(context),
                  child: const Buttons(color: kRed, text: "Exit"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
