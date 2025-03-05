import 'package:flutter/material.dart';

class TrendingStartupCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const TrendingStartupCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 179, // Adjust width for better spacing
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      padding: EdgeInsets.only(left: 8, right: 8, top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imageUrl,
                height: 80,
                width: 139,

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class TrendingStartupsList extends StatelessWidget {
//   final List<Map<String, String>> startups = [
//     {
//       "image": "Assets/images/crypto_trade.png",
//       "title": "CryptoTrade",
//       "subtitle": "+125% growth"
//     },
//     {
//       "image": "Assets/images/edu_tech.png",
//       "title": "EduTech",
//       "subtitle": "+85% growth"
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 190, // Adjusted height to fit card size
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: startups.length,
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         itemBuilder: (context, index) {
//           return TrendingStartupCard(
//             imageUrl: startups[index]["image"]!,
//             title: startups[index]["title"]!,
//             subtitle: startups[index]["subtitle"]!,
//           );
//         },
//       ),
//     );
//   }
// }
