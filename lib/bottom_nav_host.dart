import "package:flutter/material.dart";
import "package:newsapp/bookmark.dart";
import "package:newsapp/explore.dart";
import "package:newsapp/home.dart";
import "package:newsapp/navbar.dart";
import "package:newsapp/profile.dart";
class BottomNavHost extends StatefulWidget {
  const BottomNavHost({super.key});

  @override
  State<BottomNavHost> createState() => _BottomNavHostState();
}

class _BottomNavHostState extends State<BottomNavHost> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    ExploreScreen(),
    BookmarkScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: SafeArea( 
      child: _pages[_selectedIndex],
    ),
      bottomNavigationBar: BottomNavBar(
        isHomeSelected: _selectedIndex == 0,
        isExploreSelected: _selectedIndex == 1,
        isBookmarkSelected: _selectedIndex == 2,
        isProfileSelected: _selectedIndex == 3,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
