import 'package:flutter/material.dart';

class FloatAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatAddButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.white,
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        side: BorderSide(color: Colors.black, width: 2.0),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}
