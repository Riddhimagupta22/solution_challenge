import 'package:flutter/material.dart';
import '../Screen/Account/account.dart';
import '../Screen/Chat/chat.dart';
import '../Screen/Events/event.dart';
import '../Screen/Explore/explore.dart';
import '../Screen/dashbord/dashboard.dart';


class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {

  final PageController _pageViewController = PageController();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          Dashboard(),
          Explore(),
          Chat(),
          Event(),
          Account(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,

          selectedItemColor: Colors.blue,
          unselectedItemColor:  Color(0xFF999999),
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            _pageViewController.jumpToPage(index);
          },items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Dahboard'),
        BottomNavigationBarItem(icon: Icon(Icons.explore_rounded), label: 'Explore'),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded), label: 'Chat'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none), label: 'Events'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined), label: 'Account'),
      ]),
    );
  }
}
