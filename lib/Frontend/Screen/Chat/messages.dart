import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded))],
      ),
    );
  }
}
