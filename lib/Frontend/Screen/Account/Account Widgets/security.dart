import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Security extends StatelessWidget {
  String title;
  IconData icon;
  Color color;


  Security({required this.title,required this.icon, required this.color,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title,
          style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w500, color: color)),
      onTap: () {},
    );
  }
}
