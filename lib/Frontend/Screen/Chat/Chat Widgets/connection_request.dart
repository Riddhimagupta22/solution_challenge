import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectionRequests extends StatelessWidget {
  final List<Map<String, String>> connectionRequests = [
    {"name": "Sriharsha Majety", "role": "Swiggy", "image": "Assets/images/sriharsha majesty.png"},
    {"name": "Sriharsha Majety", "role": "Swiggy", "image": "Assets/images/sriharsha majesty.png"},
    {"name": "Sriharsha Majety", "role": "Swiggy", "image": "Assets/images/sriharsha majesty.png"},
    {"name": "Sriharsha Majety", "role": "Swiggy", "image": "Assets/images/sriharsha majesty.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 155,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: connectionRequests.length,
            itemBuilder: (context, index) {
              final request = connectionRequests[index];
              return Padding(
                padding: const EdgeInsets.only(right: 5.0, left: 8),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(request["image"]!),
                    ),
                    SizedBox(height: 5),
                    Text(
                      request["name"]!,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      request["role"]!,
                      style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        textStyle: GoogleFonts.poppins(fontSize: 14),
                      ),
                      child: Text("Accept"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
