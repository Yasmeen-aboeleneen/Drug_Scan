import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Localization/lo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyLoController controller = Get.find();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kveryWhite,
      appBar: AppBar(
        toolbarHeight: h * .1,
        backgroundColor: kveryWhite,
        centerTitle: true,
        iconTheme: const IconThemeData(color: kPrimary),
        title: Text(
          "Choose Language".tr,
          style: GoogleFonts.lora(
              color: kPrimary, fontWeight: FontWeight.bold, fontSize: w * .07),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: h * .08,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.changeLang('ar');
                  },
                  child: Container(
                    height: h * .2,
                    width: w * .4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('Assets/ar.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.changeLang('en');
                  },
                  child: Container(
                    height: h * .2,
                    width: w * .4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('Assets/en.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * .08,
          ),
        ],
      ),
    );
  }
}
