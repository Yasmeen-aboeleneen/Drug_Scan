import 'package:flutter/material.dart';

import 'package:drug_scan_app/Core/Constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.icon,
    required this.filledcolor,
    required this.hintcolor, required Color iconColor,
  });

  final String hintText;
  final TextInputType keyboardType;
  final IconData icon;
  final Color filledcolor;
  final Color hintcolor;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        keyboardType: keyboardType,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          fillColor: filledcolor,
          filled: true,
          suffixIcon: Icon(
            icon,
            color: kPrimary,
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1, color: kveryWhite)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1, color: kveryWhite)),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: w * .032,
            fontWeight: FontWeight.bold,
            color: hintcolor, // Set the hint text color here
          ),
        ),
      ),
    );
  }
}

