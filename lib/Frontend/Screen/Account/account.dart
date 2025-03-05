import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black87, Colors.grey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              ''),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.camera_alt,
                                size: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "xyz",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTag("Founder"),
                        _buildTag("Investor"),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            // Personal Information
            _buildSection(
              title: "Personal Information",
              icon: Icons.edit,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField("Full Name", "Alexander Mitchell"),
                  _buildTextField("Bio",
                      "Serial entrepreneur with 10+ years experience in SaaS and fintech. Currently building next-gen financial solutions for startups."),
                ],
              ),
            ),

            // My Startups
            _buildSection(
              title: "My Startups",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStartupCard("Boat", "Founder", "Assets/images/Boat-Logo_2.webp"),
                  _buildStartupCard(
                      "PhonePe", "Investor", "Assets/images/th.jpg"),
                ],
              ),
            ),

            // Notification Settings
            _buildSection(
              title: "Notification Settings",
              child: Column(
                children: [
                  _buildToggle("Push Notifications", "Updates and alerts"),
                  _buildToggle("Email Notifications", "Weekly digest"),
                ],
              ),
            ),

            // Security Settings
            _buildSection(
              title: "Security",
              child: Column(
                children: [
                  _buildListTile("Change Password", Icons.lock, Colors.grey),
                  _buildListTile("Logout", Icons.logout, Colors.red),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Profile Role Tags
  Widget _buildTag(String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
      ),
    );
  }

  // Reusable Section Widget
  Widget _buildSection(
      {required String title, IconData? icon, required Widget child}) {
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
              if (icon != null) Icon(icon, size: 18, color: Colors.black54),
            ],
          ),
          SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  // Reusable Text Field
  Widget _buildTextField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600])),
          SizedBox(height: 4),
          Text(value, style: GoogleFonts.poppins(fontSize: 14)),
        ],
      ),
    );
  }

  // Startup Cards
  Widget _buildStartupCard(String title, String subtitle, String imagePath) {
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

  // Toggle Switch
  Widget _buildToggle(String title, String subtitle) {
    return ListTile(
      title: Text(title,
          style:
              GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle,
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
      trailing: Switch(value: false, onChanged: (val) {}),
    );
  }

  // List Tile for Security Section
  Widget _buildListTile(String title, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title,
          style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w500, color: color)),
      onTap: () {},
    );
  }
}
