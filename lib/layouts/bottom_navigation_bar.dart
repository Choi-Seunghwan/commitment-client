import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  int selectedIndex;
  Function(int) onItemTapped;

  MyBottomNavigationBar(
      {required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Page'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home")
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}
