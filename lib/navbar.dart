import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: const Color(0xFF4A6B25),
      unselectedItemColor: Colors.grey,
      backgroundColor: const Color(0xFFFFF7ED),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w700, // ✅ Bold for selected
        fontSize: 14,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600, // ✅ Slightly bold for unselected
        fontSize: 14,
      ),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month), label: "Crop Calendar"),
        BottomNavigationBarItem(
            icon: Icon(Icons.message), label: "Messages"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
