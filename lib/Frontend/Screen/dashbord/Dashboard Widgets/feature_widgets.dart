import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String value;

  FeatureCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    var srcwidth = MediaQuery.of(context).size.width;
    var srcheigth = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        width: srcwidth*.110,
        height: srcheigth*.08,
        padding: EdgeInsets.only(top: srcwidth*.02,left: srcwidth*.03),
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
              style: GoogleFonts.poppins(fontSize: srcwidth*.03, color: Colors.black54),
            ),
            SizedBox(height: srcheigth*.009,),

            Text(
              value,
              style: GoogleFonts.poppins(fontSize: srcwidth*.05, fontWeight: FontWeight.w700),
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
    var srcwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric( vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeatureCard(title: "Portfolio Value", value: "\$2.4M"),
          SizedBox(width: srcwidth*.02,),

          FeatureCard(title: "Connections", value: "342"),
          SizedBox(width: srcwidth*.02,),

          FeatureCard(title: "Pending", value: "12"),
          SizedBox(width: srcwidth*.02,),
        ],
      ),
    );
  }
}
