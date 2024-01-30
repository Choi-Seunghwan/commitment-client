import 'package:commitment_client/screens/home_page.dart';
import 'package:commitment_client/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserAccount();
  }

  Future<void> _checkUserAccount() async {
    final prefs = await SharedPreferences.getInstance();
    final isUserLoggedIn = prefs.getBool('token') ?? false;

    // token check

    if (isUserLoggedIn) {
      // 사용자가 로그인한 경우 홈 페이지로 이동
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      // 사용자가 로그인하지 않은 경우 로그인 페이지로 이동
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
