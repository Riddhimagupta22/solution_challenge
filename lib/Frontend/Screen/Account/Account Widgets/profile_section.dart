import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSection extends StatelessWidget {
  String title;
  IconData?icon;
  Widget child;

   ProfileSection({required this.title,required this.icon,required this.child});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(title,
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold))),
              if (icon != null) IconButton(onPressed: (){}, icon: Icon(icon, size: 18, color: Colors.black54))
            ],
          ),
          SizedBox(height: 8),
          child,
        ],
      ),
    );
}}
