import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String title;

  const SubTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Expanded(
          child: Divider(
            height: 4,
            color: Colors.white,
            indent: 5,
            endIndent: 5,
          ),
        )
      ],
    );
  }
}
