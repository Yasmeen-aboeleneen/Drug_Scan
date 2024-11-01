// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:drug_scan_app/Core/Constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required Color iconColor,
    required this.hintText,
    required this.keyboardType,
    required this.icon,
  }) : super(key: key);
  final String hintText;
  final TextInputType keyboardType;
  // final TextEditingController textEditingController;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        keyboardType: keyboardType,
        // controller: textEditingController,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          fillColor: kveryWhite,
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
          ),
        ),
      ),
    );
  }
}
