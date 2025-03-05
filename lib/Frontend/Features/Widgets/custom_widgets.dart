import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWidgets {
  static CustomTextfield(
      {required String label,
        required String text,
        required IconData icon,
        required controller}) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return label;
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            iconColor: Colors.black,
            hintText: text,
            hintStyle: GoogleFonts.poppins(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            )),
      ),
    );
  }

  static CustomDashboardText(String label,
      String text,){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w500 ),),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(label,style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 15),),
        ),

      ],
    );
  }
}
