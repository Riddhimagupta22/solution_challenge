import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpcomingEvents extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      "day": "15",
      "month": "MAR",
      "title": "Startup Pitch Night",
      "location": "Virtual event",
      "time": "7:00 PM EST"
    },
    {
      "day": "22",
      "month": "MAR",
      "title": "Venture Capital Workshop",
      "location": "Boston",
      "time": "10:00 AM EST"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true, // Important for embedding in other widgets
          physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // Date Section
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        children: [
                          Text(
                            event['day']!,
                            style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            event['month']!,
                            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    // Event Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event['title']!,
                            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${event['location']} • ${event['time']}",
                            style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "RSVP Now",
                            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
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
