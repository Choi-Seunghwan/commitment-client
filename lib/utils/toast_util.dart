import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSuccessToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green[300],
      textColor: Colors.black,
      fontSize: 16.0);
}

void showWarringToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.yellow[300],
      textColor: Colors.black,
      fontSize: 16.0);
}
