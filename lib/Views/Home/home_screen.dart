import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Views/Profile/profile_screen.dart';
import 'package:drug_scan_app/Widgets/custom_capture_button.dart';
import 'package:drug_scan_app/Widgets/image_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                            builder: (context) => const ProfileScreen()));
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
                    onTap: () {},
                    child: const CustomCaptureButton(
                        text: 'Capture image', icon: Icons.camera_alt),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: w * .01),
                  child: GestureDetector(
                    onTap: () {},
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
