import 'package:flutter/material.dart';
import 'package:solution_chanllenge/Frontend/Features/Widgets/custom_widgets.dart';
import 'package:solution_chanllenge/Frontend/Screen/dashbord/Dashboard%20Widgets/feature_widgets.dart';
import 'package:solution_chanllenge/Frontend/Screen/dashbord/Dashboard%20Widgets/message_widget.dart';
import 'package:solution_chanllenge/Frontend/Screen/dashbord/Dashboard%20Widgets/startup_card.dart';
import 'package:solution_chanllenge/Frontend/Screen/dashbord/Dashboard%20Widgets/success_story.dart';
import 'package:solution_chanllenge/Frontend/Screen/dashbord/Dashboard%20Widgets/trending_startups.dart';
import 'package:solution_chanllenge/Frontend/Screen/dashbord/Dashboard%20Widgets/upcoming_events.dart';

class Dashboard extends StatelessWidget {
  final List<Map<String, String>> startups = [
    {
      "image": "Assets/images/IMG@1x (10).png",
      "title": "OctoTrade",
      "subtitle": "+100% growth"
    },
    {
      "image": "Assets/images/IMG@1x (11).png",
      "title": "EdTech",
      "subtitle": "+100% growth"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("Assets/images/profile.png"),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Text("User Name", style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardStats(),
              SizedBox(height: 15),

              CustomWidgets.CustomDashboardText('View All', 'Featured Startups'),
              StartupCard(
                imageUrl: "Assets/images/IMG@1x (9).png",
                title: "EcoTech Solutions",
                subtitle: "Sustainable energy management platform",
                fundingStage: "Series A",
                raisedAmount: "\$5M",
              ),
              SizedBox(height: 15),
              CustomWidgets.CustomDashboardText('View calendar', 'Upcoming Events'),
              SizedBox(height: 15),
              UpcomingEvents(),

              SizedBox(height: 15),
              CustomWidgets.CustomDashboardText('View more', 'Trending Startups'),
              SizedBox(height: 15),
              SizedBox(
                height: 190, // Adjusted height to fit card size
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: startups.length,
                  itemBuilder: (context, index) {
                    return TrendingStartupCard(
                      imageUrl: startups[index]["image"]!,
                      title: startups[index]["title"]!,
                      subtitle: startups[index]["subtitle"]!,
                    );
                  },
                ),
              ),

              SizedBox(height: 15),
              CustomWidgets.CustomDashboardText('View all', 'Messages & Requests'),
              SizedBox(height: 15),
              MessageList(),

              SizedBox(height: 15),
              CustomWidgets.CustomDashboardText('View all', 'Success Stories'),
              SizedBox(height: 15),
              SuccessStoryCard(imageUrl: "Assets/images/IMG@1x (9).png", title: "Swiggy", subtitle: "No order Too small", imageUrl1: "imageUrl1", name: "Sriharsha Majety", designation: 'CEO and Founders')
            ],
          ),
        ),
      ),
    );
  }
}
