// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:drug_scan_app/Core/Constants/colors.dart';

class InfoSideBar extends StatelessWidget {
  const InfoSideBar({
    super.key,
    required this.status,
    required this.name,
  });
  final String name, status;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 20,
        backgroundColor: kveryWhite,
        child: Icon(
          Icons.person_2_rounded,
          size: 30,
          color: kPrimary,
        ),
      ),
      title: Text(
        name,
        style:
            GoogleFonts.aBeeZee(fontWeight: FontWeight.w700, color: kveryWhite),
      ),
      subtitle: Text(
        status,
        style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w500, color: kGrey),
      ),
    );
  }
}
