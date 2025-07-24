import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textcolor;

  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textcolor,
      ),
    );
  }
}
