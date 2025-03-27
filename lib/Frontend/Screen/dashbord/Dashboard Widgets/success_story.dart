import 'package:flutter/material.dart';

class SuccessStoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String imageUrl1;
  final String name;
  final String designation;

  const SuccessStoryCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.imageUrl1,
    required this.name,
    required this.designation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 284,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.only(left: 8,right: 8,top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              imageUrl,
              height: 150,
              width: 331,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 8),
                Row(

                  children: [
                    CircleAvatar(backgroundImage:AssetImage(
                      imageUrl1,

                    ), ),

                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text(
                        name,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        designation,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),]),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
