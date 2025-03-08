import 'package:flutter/material.dart';
import 'package:solution_chanllenge/Frontend/Screen/Chat/Chat%20Widgets/connection_request.dart';
import 'package:solution_chanllenge/Frontend/Screen/Chat/Chat%20Widgets/messages_list.dart';


class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView( // Allows the entire page to be scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16,top: 2),
              child: Text(
                "Connection Requests",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 10),
              child: ConnectionRequests(),
            ),

            // Message List with Full Grey Background
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey.shade300, Colors.grey.shade100], // Smooth gradient
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 1), // Adds spacing inside
              child: MessagesList(), // Message List inside
            ),
          ],
        ),
      ),
    );
  }
}
