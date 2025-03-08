import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {
      "name": "Sriharsha Majety",
      "role": "Lead Investor, Swiggy",
      "message": "Thanks for sharing your pitch",
      "time": "2m ago",
      "image": "https://via.placeholder.com/150"
    }, {
      "name": "Sriharsha Majety",
      "role": "Lead Investor, Swiggy",
      "message": "Thanks for sharing your pitch",
      "time": "2m ago",
      "image": "https://via.placeholder.com/150"
    }, {
      "name": "Sriharsha Majety",
      "role": "Lead Investor, Swiggy",
      "message": "Thanks for sharing your pitch",
      "time": "2m ago",
      "image": "https://via.placeholder.com/150"
    }, {
      "name": "Sriharsha Majety",
      "role": "Lead Investor, Swiggy",
      "message": "Thanks for sharing your pitch",
      "time": "2m ago",
      "image": "https://via.placeholder.com/150"
    },

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(message["image"]!),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(message["name"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(message["time"]!, style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message["role"]!,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 5),
                Text(
                  message["message"]!,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            trailing: Icon(Icons.circle, size: 8, color: Colors.orange),
          ),
        );
      },
    );
  }
}
