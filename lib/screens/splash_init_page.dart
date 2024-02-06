import 'package:commitment_client/provider/auth_provider.dart';
import 'package:commitment_client/screens/login_page.dart';
import 'package:commitment_client/screens/my_commitment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashInitPage extends StatefulWidget {
  const SplashInitPage({super.key});

  @override
  SplashInitPageState createState() => SplashInitPageState();
}

class SplashInitPageState extends State<SplashInitPage> {
  @override
  void initState() {
    super.initState();
    _bootInitialization();
  }

  /// 앱 초기화 로직.
  /// todo: Page와 초기 로직 분리가 되어야 함
  /// 기본 4초 스플래시 화면이 보여짐.
  Future<void> _bootInitialization() async {
    final splashDelay = Future.delayed(const Duration(seconds: 4));
    final initCheckAuth = _checkAuth();

    await Future.wait([splashDelay, initCheckAuth]);
  }

  Future<void> _checkAuth() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (!authProvider.isAuthenticated) {
      await authProvider.initUserAuth();
    }

    if (authProvider.isAuthenticated) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const MyCommitmentPage()));
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
