import 'dart:io';
import 'package:drug_scan_app/Views/Home/result_screen_positive.dart';
import 'package:drug_scan_app/Views/Home/result_screen_negative.dart'; 
import 'package:drug_scan_app/Widgets/scan_button.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:get/get.dart';

class ExaminationScreen extends StatefulWidget {
  const ExaminationScreen({super.key, required this.imageFile});
  final File imageFile;

  @override
  // ignore: library_private_types_in_public_api
  _ExaminationScreenState createState() => _ExaminationScreenState();
}

class _ExaminationScreenState extends State<ExaminationScreen> {
  String _scanResult = "Processing...".tr;
  bool _isScanning = false;

  final List<String> drugNames = [
    "cannabinoids",
    "opiate",
    "tramadol",
    "heroin",
    "morphine",
    "positive"
  ];

  Future<void> _scanImage() async {
    final textRecognizer = TextRecognizer();
    try {
      final inputImage = InputImage.fromFile(widget.imageFile);
      final recognizedText = await textRecognizer.processImage(inputImage);

      setState(() {
        _scanResult = recognizedText.text.isNotEmpty
            ? recognizedText.text
            : "No text found in the image.";
        _isScanning = false;
      });

      final containsDrug = drugNames.any(
          (drug) => _scanResult.toLowerCase().contains(drug.toLowerCase()));

      if (containsDrug) {
        String detectedDrug = drugNames.firstWhere(
          (drug) => _scanResult.toLowerCase().contains(drug.toLowerCase()),
          orElse: () => "Unknown",
        );

        Get.to(() => ResultScreenIsPositive(
              result: "Positive".tr,
              detectedDrug: detectedDrug,
            ));
      } else if (_scanResult.toLowerCase().contains("negative")) {
        Get.to(() => ResultScreenIsNegative(
              result: "Negative".tr,
            ));
      } else {
        _showErrorDialog(
            "Invalid Image", "The image does not contain any drug type.");
      }
    } catch (e) {
      setState(() {
        _scanResult = "Error occurred while scanning: $e";
        _isScanning = false;
      });
      _showErrorDialog("Error", "An error occurred while scanning the image.");
    } finally {
      textRecognizer.close();
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kPrimary,
      body: Column(
        children: [
          SizedBox(height: h * .05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * .05),
            child: Container(
              height: h * .62,
              width: w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(widget.imageFile),
                  fit: BoxFit.fill,
                ),
                border: Border.all(width: w * .02, color: kveryWhite),
                color: kveryWhite,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          SizedBox(height: h * .05),
          _isScanning
              ? const CircularProgressIndicator(color: kveryWhite)
              : Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(w * .05),
                    child: SingleChildScrollView(
                      child: Text(
                        _scanResult,
                        style: TextStyle(
                          color: kveryWhite,
                          fontSize: w * .05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isScanning = true;
              });
              _scanImage();
            },
            child: ScanButton(
              text: "Start Scanning".tr,
            ),
          ),
          SizedBox(
            height: h * .1,
          )
        ],
      ),
    );
  }
}
