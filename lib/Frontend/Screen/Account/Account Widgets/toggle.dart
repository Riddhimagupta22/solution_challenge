import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Toggle extends StatelessWidget {
  String title;
  String subtitle;
   Toggle({required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style:
          GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle,
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
      trailing: Switch(value: false, onChanged: (val) {}),
    );
  }
}
