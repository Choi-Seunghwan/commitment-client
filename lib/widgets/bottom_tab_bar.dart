import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(tabs: [
      Tab(icon: Icon(Icons.person)),
      Tab(
        icon: Icon(Icons.home),
      )
    ]);
  }
}
