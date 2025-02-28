import 'dart:io';

import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Views/Home/examination_screen.dart';
import 'package:drug_scan_app/Widgets/custom_capture_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CustomBottomContainer extends StatefulWidget {
  const CustomBottomContainer({super.key});

  @override
  State<CustomBottomContainer> createState() => _CustomBottomContainerState();
}

class _CustomBottomContainerState extends State<CustomBottomContainer> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => ExaminationScreen(imageFile: _imageFile!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * .63,
      width: w,
      decoration: const BoxDecoration(
          color: kPrimary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: h * .08,
          ),
          Text(
            'Upload your medical\n examination result'.tr,
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: w * .09,
                color: kveryWhite),
          ),
          SizedBox(
            height: h * .1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: w * .01),
                child: GestureDetector(
                  onTap: () => _pickImage(ImageSource.camera),
                  child: CustomCaptureButton(
                      text: 'Captureimage'.tr, icon: Icons.camera_alt),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: w * .01),
                child: GestureDetector(
                  onTap: () => _pickImage(ImageSource.gallery),
                  child: CustomCaptureButton(
                      text: 'FromGallery'.tr, icon: Icons.photo),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
