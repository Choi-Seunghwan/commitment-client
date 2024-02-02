import 'package:commitment_client/provider/auth_provider.dart';
import 'package:commitment_client/screens/home_page.dart';
import 'package:commitment_client/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startInitialization();
  }

  /// 앱 초기화 로직.
  /// todo: Page와 초기 로직 분리가 되어야 함
  /// 기본 4초 스플래시 화면이 보여짐.
  Future<void> _startInitialization() async {
    final splashDelay = Future.delayed(const Duration(seconds: 4));
    final initCheckLogin = _checkIsLogin();

    await Future.wait([splashDelay, initCheckLogin]);
  }

  Future<void> _checkIsLogin() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (!authProvider.isAuthenticated) {
      await authProvider.initUserAuth();
    }

    if (!authProvider.isAuthenticated) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
