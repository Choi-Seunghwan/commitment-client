import 'package:flutter/material.dart';

class FloatAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatAddButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed, backgroundColor: Colors.blue, child: const Icon(Icons.add));
  }
}
