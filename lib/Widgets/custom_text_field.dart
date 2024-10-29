// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:drug_scan_app/Core/Constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    // required this.textEditingController,
    required this.maxLen,
    required this.icon,
    required Color iconColor,
  }) : super(key: key);
  final String hintText;
  final TextInputType keyboardType;
  // final TextEditingController textEditingController;
  final int maxLen;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return TextFormField(
      keyboardType: keyboardType,
      // controller: textEditingController,
      textCapitalization: TextCapitalization.words,
      maxLength: maxLen,
      decoration: InputDecoration(
        fillColor: kveryWhite,
        filled: true,
        suffixIcon: Icon(
          icon,
          color: kPrimary,
        ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: 2.5, color: kveryWhite)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: 2.5, color: kveryWhite)),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: w * .029,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
