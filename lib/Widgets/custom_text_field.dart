// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:drug_scan_app/Core/Constants/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required Color iconColor,
    required this.hintText,
    required this.keyboardType,
    required this.icon,
    required this.filledcolor,
    required this.hintcolor, this.controller,
  });

  final String hintText;
  final TextInputType keyboardType;
  final IconData icon;
  final Color filledcolor;
  final Color hintcolor;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        cursorColor: kPrimary,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          fillColor: widget.filledcolor,
          filled: true,
          suffixIcon: Icon(
            widget.icon,
            color: kPrimary,
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1, color: kveryWhite)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1, color: kveryWhite)),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: w * .032,
            fontWeight: FontWeight.bold,
            color: widget.hintcolor,
          ),
        ),
      ),
    );
  }
}
