import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCancelButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomCancelButton({
    Key? key,
    required this.onPressed,
    this.text = 'Cancel',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade300, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF414651),
        ),
      ),
    );
  }
}
