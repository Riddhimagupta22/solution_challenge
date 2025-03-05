import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_chanllenge/Frontend/Role%20Chossing/role_card.dart';

class RoleChossing extends StatelessWidget {
  final List<Map<String, String>> roles = [
    {"title": "Entrepreneur", "subtitle": "Launch and grow your startup", "image": "Assets/images/IMG@1x (5).png"},
    {"title": "Investor", "subtitle": "Fund promising ventures", "image": "Assets/images/IMG@1x (6).png"},
    {"title": "Mentor", "subtitle": "Share your expertise", "image": "Assets/images/IMG@1x (8).png"},
    {"title": "Incubator", "subtitle": "Support innovation", "image": "Assets/images/IMG@1x (7).png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "StartWise",
                    style: GoogleFonts.lobster(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Sign In", style: TextStyle(color: Colors.black87)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Choose Your Role",
                style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Join our community and connect with the right people",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: roles.length,
                  itemBuilder: (context, index) {
                    return RoleCard(
                      title: roles[index]['title']!,
                      subtitle: roles[index]['subtitle']!,
                      image: roles[index]['image']!,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Get Started", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                icon: Icon(FontAwesomeIcons.google, color: Colors.black),
                label: Text("Continue with Google", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

