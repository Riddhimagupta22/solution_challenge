import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      "image": "Assets/images/IMG@1x (12).png",
      "title": "Sara sharma",
      "subtitle": "Investment proposal discussion",
      "icon": Icons.send,
    },
    {
      "image": "Assets/images/IMG@1x (14).png",
      "title": "Sahil Verma",
      "subtitle": "Connection Request",
      "icon": Icons.person_add_alt_1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(message['image']!),
                      radius: 25,
                    ),
                    SizedBox(width: 15),
                    // Message Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message['title']!,
                            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                          Text(
                            message['subtitle']!,
                            style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    Icon(message['icon'], ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
