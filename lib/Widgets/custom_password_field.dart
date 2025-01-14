import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:flutter/material.dart';

class CustomPasswordtextfield extends StatefulWidget {
  const CustomPasswordtextfield({
    super.key,
    this.controller,
  });

  // final String? Function(String?) valid;
  final TextEditingController? controller;

  @override
  State<CustomPasswordtextfield> createState() =>
      _CustomPasswordtextfieldState();
}

class _CustomPasswordtextfieldState extends State<CustomPasswordtextfield> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        // validator: widget.valid,
        controller: widget.controller,
        obscureText: _obscured,
        decoration: InputDecoration(
          fillColor: kveryWhite,
          filled: true,
          hintText: "Enter Password",
          hintStyle: TextStyle(
            fontSize: w * .032,
            fontWeight: FontWeight.bold,
            color: kBlack,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          suffixIcon: GestureDetector(
            onTap: _toggleObscured,
            child: Icon(
              _obscured ? Icons.lock_outline : Icons.lock_open,
              color: kPrimary,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1, color: kveryWhite)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1, color: kveryWhite)),
        ),
        cursorColor: kPrimary,
      ),
    );
  }
}
