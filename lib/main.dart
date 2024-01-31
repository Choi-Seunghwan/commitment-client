import 'package:commitment_client/provider/auth_provider.dart';
import 'package:commitment_client/screens/splash_screen.dart';
import 'package:commitment_client/service/api_client.dart';
import 'package:commitment_client/service/auth_service.dart';
import 'package:commitment_client/service/commitment_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env.dev");

  runApp(
    MultiProvider(
      providers: [
        Provider<ApiClient>(
          create: (_) => ApiClient(),
        ),
        ProxyProvider<ApiClient, CommitmentService>(
          update: (_, apiClient, __) => CommitmentService(apiClient),
        ),
        ProxyProvider<ApiClient, AuthService>(update: (_, apiClient, __) => AuthService(apiClient)),
        // ProxyProvider<AuthService, AuthProvider>(update: (_, authService, __) => AuthProvider(authService)),
        ChangeNotifierProxyProvider<AuthService, AuthProvider>(
          create: (context) => AuthProvider(Provider.of<AuthService>(context, listen: false)),
          update: (context, authService, previous) => AuthProvider(authService),
        ),
        // ProxyProvider<ApiClient, AuthService>(update: (_, apiClient, __) => AuthService(apiClient)),
      ],
      child: const CommitmentApp(),
    ),
  );
}

class CommitmentApp extends StatelessWidget {
  const CommitmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Commitment',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
