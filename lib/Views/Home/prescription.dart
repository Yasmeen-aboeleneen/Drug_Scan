import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Prescription extends StatelessWidget {
  const Prescription({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kveryWhite,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kveryWhite),
        centerTitle: true,
        title: Text(
          "Treatment Plan".tr,
          style:
              GoogleFonts.lora(color: kveryWhite, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Follow the below steps for your recovery:".tr,
              style: GoogleFonts.lora(
                  color: kPrimary,
                  fontSize: w * .05,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: h * 0.02),
            Container(
              width: w,
              height: h * .2,
              decoration: const BoxDecoration(
                  color: kGrey,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          "1. Take the prescribed medication daily.\n"
                          "2. Avoid any substances causing issues.\n"
                          "3. Follow up with your counselor weekly.\n"
                          "4. Maintain a healthy lifestyle and stay hydrated.",
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.04),
            Text(
              "Prescription",
              style: GoogleFonts.lora(
                  color: kRed, fontWeight: FontWeight.bold, fontSize: w * .06),
            ),
            SizedBox(height: h * 0.02),
            Container(
              padding: const EdgeInsets.all(5),
              width: w,
              height: h * .4,
              decoration: const BoxDecoration(
                  color: kGrey,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Controloc 40 mg',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'قرص قبل الفطار',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(height: h * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Divakote  500 mg',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'قرص مرتين في اليوم\n (صباحا ومساء)',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(height: h * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Arythrex  200 mg',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'قرص بعد الغذاء',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(height: h * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gralipentin XR 300 mg',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'قرص مرتين في اليوم \n(صباحا ومساء)',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(height: h * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dogmatil 50 mg',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'قرص مرتين في اليوم \n(صباحا ومساء)',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(height: h * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Clozapex 25 mg',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          ' قرص قبل النوم',
                          style: GoogleFonts.lora(
                              color: kBlack,
                              fontSize: w * .045,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
