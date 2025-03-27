import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solution_chanllenge/Frontend/Features/bottomnav_bar.dart';
import 'package:solution_chanllenge/Frontend/Role%20Choosing/role_card.dart';

class RoleChoosing extends StatelessWidget {
  final List<Map<String, String>> roles = [
    {"title": "Entrepreneur", "subtitle": "Launch and grow your startup", "image": "Assets/images/IMG@1x (5).png"},
    {"title": "Investor", "subtitle": "Fund promising ventures", "image": "Assets/images/IMG@1x (6).png"},
    {"title": "Mentor", "subtitle": "Share your expertise", "image": "Assets/images/IMG@1x (8).png"},
    {"title": "Incubator", "subtitle": "Support innovation", "image": "Assets/images/IMG@1x (7).png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SparkHub",
          style: GoogleFonts.inter(fontSize: 23, fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Choose Your Role",
                  style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700, height: 1.2),
                ),
              ),
              Text(
                "Join our community and connect with the right people",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.black54),
              ),
              SizedBox(height: 40),
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 25,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: roles.length,
                  itemBuilder: (context, index) {
                    return RoleCard(
                      title: roles[index]['title']??"Default title",
                      subtitle: roles[index]['subtitle']??"Default subtitle",
                      image: roles[index]['image']??"Default img",
                    );
                  },
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavbar()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Get Started", style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
