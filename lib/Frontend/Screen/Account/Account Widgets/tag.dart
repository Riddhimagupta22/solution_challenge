import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class RoleTag extends StatelessWidget {
  String text;
  RoleTag({required this.text});

  @override
  Widget build(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
    ),
  );
}}