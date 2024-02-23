import 'package:commitment_client/strings/strings.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  int selectedIndex;
  Function(int) onItemTapped;

  MyBottomNavigationBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.travel_explore), label: Strings.NAV_HOME),
        BottomNavigationBarItem(
          icon: Icon(Icons.accessibility_new),
          label: Strings.NAV_COMMITMENTS,
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}
