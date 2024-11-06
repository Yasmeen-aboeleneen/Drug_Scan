import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:drug_scan_app/Widgets/info_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: w * .8,
        decoration: const BoxDecoration(color: kPrimary),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: h * .02),
                const InfoSideBar(
                  name: "Yasmeen Tarek",
                  status: "Student",
                ),
                SizedBox(height: h * .05),
                Column(children: [
                  Padding(
                    padding: EdgeInsets.only(left: w * .05),
                    child: const Divider(
                      color: kGrey,
                      height: .2,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const SizedBox(
                      width: 34,
                      height: 34,
                      child: Icon(
                        Icons.language_rounded,
                        color: kveryWhite,
                      ),
                    ),
                    title: Text(
                      "Switch Language",
                      style: GoogleFonts.aBeeZee(
                          color: kveryWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: w * .04),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
