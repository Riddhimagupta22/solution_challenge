import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String fundingStage;
  final String raisedAmount;

  const StartupCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.fundingStage,
    required this.raisedAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 291,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.only(left: 8,right: 8,top: 15),
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
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              imageUrl,
              height: 150,
              width: 331,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        fundingStage,
                        style: GoogleFonts.poppins(fontSize: 12, color: Colors.green[800], fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "$raisedAmount raised",
                      style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
