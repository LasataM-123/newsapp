import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final bool isHomeSelected;
  final bool isExploreSelected;
  final bool isBookmarkSelected;
  final bool isProfileSelected;
  final Function(int) onItemSelected;

  const BottomNavBar({
    super.key,
    required this.isHomeSelected,
    required this.isExploreSelected,
    required this.isBookmarkSelected,
    required this.isProfileSelected,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 0.8, color: Colors.grey[300]),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                icon: Icons.home_outlined,
                label: 'Home',
                isSelected: isHomeSelected,
                onTap: () => onItemSelected(0),
              ),
              NavItem(
                icon: Icons.explore_outlined,
                label: 'Explore',
                isSelected: isExploreSelected,
                onTap: () => onItemSelected(1),
              ),
              NavItem(
                icon: Icons.bookmark_border,
                label: 'Bookmark',
                isSelected: isBookmarkSelected,
                onTap: () => onItemSelected(2),
              ),
              NavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                isSelected: isProfileSelected,
                onTap: () => onItemSelected(3),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? Colors.blue : Colors.black54;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.5,
              color: color,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
