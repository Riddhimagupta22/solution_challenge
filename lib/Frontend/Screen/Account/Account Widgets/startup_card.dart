import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupCard extends StatelessWidget {
  String imagePath;
  String title;
  String subtitle;
  StartupCard({ required this.imagePath,required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(0, 2)),
            ]),
        child: Column(
          children: [
            Image.asset(imagePath, height: 40),
            SizedBox(height: 8),
            Text(title,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.bold)),
            Text(subtitle,
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
