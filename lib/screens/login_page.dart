import 'package:commitment_client/provider/auth_provider.dart';
import 'package:commitment_client/screens/my_commitment_page.dart';
import 'package:commitment_client/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fluttertoast/fluttertoast.dart';

void showSuccessToast() {
  Fluttertoast.showToast(
      msg: Strings.TOAST_WELCOME_SIGN_IN,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> signUpGuestHandler(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      await authProvider.signUpGuest();
      showSuccessToast();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const MyCommitmentPage()));
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Login Page"),
          ElevatedButton(
              onPressed: () => signUpGuestHandler(context), child: const Text("Guest Button"))
        ],
      ),
    ));
  }
}
