import 'package:commitment_client/screens/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CommitmentApp());
}

class CommitmentApp extends StatelessWidget {
  const CommitmentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Commitment',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainPage());
  }
}
