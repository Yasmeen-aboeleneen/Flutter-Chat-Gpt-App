// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:raya_institute_chat_app/Core/Constants/colors.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      height: h * .06,
      width: w * .35,
      decoration: BoxDecoration(
          color: kveryWhite, borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: GoogleFonts.lora(
              color: kSecondary,
              fontSize: w * 0.07,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: w * .02,
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            weight: w * .05,
            color: kSecondary,
          )
        ],
      ),
    );
  }
}
