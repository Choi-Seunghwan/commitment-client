import 'package:commitment_client/provider/auth_provider.dart';
import 'package:commitment_client/screens/main_page.dart';
import 'package:commitment_client/screens/my_commitment_page.dart';
import 'package:commitment_client/strings/strings.dart';
import 'package:commitment_client/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> signUpGuestHandler(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      await authProvider.signUpGuest();
      showSuccessToast(Strings.TOAST_WELCOME_SIGN_IN);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainPage()));
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
