import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solution_chanllenge/Frontend/Screen/Account/Account%20Widgets/personal_info.dart';
import 'package:solution_chanllenge/Frontend/Screen/Account/Account%20Widgets/profile_section.dart';
import 'package:solution_chanllenge/Frontend/Screen/Account/Account%20Widgets/security.dart';
import 'package:solution_chanllenge/Frontend/Screen/Account/Account%20Widgets/startup_card.dart';
import 'package:solution_chanllenge/Frontend/Screen/Account/Account%20Widgets/tag.dart';

import 'package:solution_chanllenge/Frontend/Screen/Account/Account%20Widgets/toggle.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
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
                          radius: 50,
                          child: Icon(Icons.perm_identity,size: 45,),
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
                      "Ravi Vittal",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoleTag(text: "Founder"),
                        RoleTag(text: "Investor")
                      ],
                    ),
                    SizedBox(height: 9),
                  ],
                ),
              ),
            ),
            SizedBox(height: 9),

            ProfileSection(
              title: "Personal Information",
              icon: Icons.edit,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PersonalInfo(label: "Full Name", value: "Ravi Vittal"),
                  PersonalInfo(
                      label: "Bio",
                      value:
                          "Serial entrepreneur with 10+ years experience in SaaS and fintech. Currently building next-gen financial solutions for startups."),
                ],
              ),
            ),

            // My Startups
            ProfileSection(title: "My Startups",
              icon: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StartupCard(
                      imagePath: "Assets/images/Boat-Logo_2.webp",
                      title: "Boat",
                      subtitle: "Founder"),
                  StartupCard(
                      imagePath: "Assets/images/th.jpg",
                      title: "PhonePe",
                      subtitle: "Investor")
                ],
              ),
            ),

            // Notification Settings
            ProfileSection(
              title: "Notification Settings",
              icon: null,
              child: Column(
                children: [
                  Toggle(
                      title: "Push Notifications",
                      subtitle: "Updates and alerts"),
                  Toggle(
                      title: "Email Notifications", subtitle: "Weekly digest"),
                ],
              ),
            ),

            // Security Settings
            ProfileSection(
              title: "Security",
              icon: null,
              child: Column(
                children: [
                  Security(
                    title: "Change Password",
                    icon: Icons.lock,
                    color: Colors.grey,
                  ),
                  Security(
                      title: "Logout", icon: Icons.logout, color: Colors.red),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
