import 'package:drug_scan_app/Core/Constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialmediaRow extends StatelessWidget {
  const SocialmediaRow({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: const BoxDecoration(
              color: kveryWhite,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          width: w * .36,
          height: h * .06,
          child: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: h * .03,
                ),
                SizedBox(
                  width: w * .01,
                ),
                Text(
                  text,
                  style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold,
                      fontSize: w * .04,
                      color: kPrimary),
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
