import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 15,
      right: 15,
      child: GestureDetector(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.black54),
              SizedBox(width: 10),
              Text("Search here...", style: TextStyle(fontSize: 16, color: Colors.black54)),
              SizedBox(width: 150),
              Icon(Icons.mic, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}
