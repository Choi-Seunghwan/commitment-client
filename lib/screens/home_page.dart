import 'package:flutter/material.dart';

import '../strings/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.NAV_HOME_TITLE,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text("Home Page"),
      ),
      backgroundColor: Colors.black,
    );
  }
}
