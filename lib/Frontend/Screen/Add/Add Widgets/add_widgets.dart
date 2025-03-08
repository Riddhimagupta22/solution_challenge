import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddWidgets{
  static CustomAddField(
      String text,){
    return SizedBox(
      height: 45,
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          hintStyle: GoogleFonts.poppins(),fillColor: Colors.white
        ),

      ),
    );
  }
}