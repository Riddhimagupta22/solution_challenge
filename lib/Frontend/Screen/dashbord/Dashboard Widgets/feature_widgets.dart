import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String value;

  FeatureCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 110,
        height: 70,
        padding: EdgeInsets.only(top: 10,left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),
            ),
            SizedBox(height: 3,),

            Text(
              value,
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeatureCard(title: "Portfolio Value", value: "\$2.4M"),
          SizedBox(width: 5,),

          FeatureCard(title: "Connections", value: "342"),
          SizedBox(width: 5,),

          FeatureCard(title: "Pending", value: "12"),
          SizedBox(width: 5,),
        ],
      ),
    );
  }
}
