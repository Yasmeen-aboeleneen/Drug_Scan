import 'dart:io';

import 'package:drug_scan_app/Core/Components/side_bar.dart';
import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Views/Home/examination_screen.dart';
import 'package:drug_scan_app/Widgets/custom_capture_button.dart';
import 'package:drug_scan_app/Widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      // التنقل إلى صفحة عرض الصورة
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: kveryWhite,
        body: Column(
          children: [
            SizedBox(
              height: h * .03,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(kPrimary)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const SideBar()));
                  },
                  icon: const Icon(
                    Icons.person_2_rounded,
                    color: kveryWhite,
                  )),
            ),
            SizedBox(
              height: h * .01,
            ),
            Image.asset(
              'Assets/logo.png',
              width: w * .8,
              height: h * .2,
            ),
            const ImageContainer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w * .01),
                  child: GestureDetector(
                    onTap: () => _pickImage(ImageSource.camera),
                    child: const CustomCaptureButton(
                        text: 'Capture image', icon: Icons.camera_alt),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: w * .01),
                  child: GestureDetector(
                    onTap: () => _pickImage(ImageSource.gallery),
                    child: const CustomCaptureButton(
                        text: 'From gallery', icon: Icons.photo),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
