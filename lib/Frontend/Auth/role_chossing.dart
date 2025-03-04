import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleChossing extends StatelessWidget {
  const RoleChossing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Venture Hub"),
        titleTextStyle:GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
          Color(0xFF619DDD),Color(0xFF)]),
        ),
      ),
    );
  }
}
