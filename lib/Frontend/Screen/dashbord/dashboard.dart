import 'package:flutter/material.dart';
import 'package:solution_chanllenge/Frontend/Features/Widgets/custom_widgets.dart';
import 'package:solution_chanllenge/Frontend/Screen/dashbord/Dashboard%20Widgets/feature_widgets.dart';

class Dashboard extends StatelessWidget {
  // final List<Map<String, String>> features = [
  //   {"title": "Portfolio Value", "subtitle": "\$2.4M"},
  //   {"title": "Connections", "subtitle": "33"},
  //   {"title": "Pending", "subtitle": "12"},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assetName"),
                radius: 30,
              ),
              title: Text("Welcome,"),
              subtitle: Text("abcd"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications),
              ),
            ),
            DashboardStats(),
            SizedBox(height: 15),
            CustomWidgets.CustomDashboardText('View All', 'Featured Startups'),
          ],
        ),
      ),
    );
  }
}
