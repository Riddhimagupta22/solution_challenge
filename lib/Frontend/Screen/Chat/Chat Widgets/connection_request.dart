import 'package:flutter/material.dart';

class ConnectionRequests extends StatelessWidget {
  final List<Map<String, String>> connectionRequests = [
    {"name": "Sriharsha Majety", "role": "Swiggy", "image": "https://via.placeholder.com/150"},
    {"name": "Sriharsha Majety", "role": "Swiggy", "image": "https://via.placeholder.com/150"},
    {"name": "Sriharsha Majety", "role": "Swiggy", "image": "https://via.placeholder.com/150"},
    {"name": "Sriharsha Majety", "role": "Swiggy", "image": "https://via.placeholder.com/150"},

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: connectionRequests.length,
            itemBuilder: (context, index) {
              final request = connectionRequests[index];
              return Padding(
                padding: const EdgeInsets.only(right: 5.0,left: 8),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(request["image"]!),
                    ),
                    SizedBox(height: 5),
                    Text(
                      request["name"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      request["role"]!,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Accept"),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
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
