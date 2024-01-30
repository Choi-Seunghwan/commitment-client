import 'package:commitment_client/screens/splash_screen.dart';
import 'package:commitment_client/service/api_client.dart';
import 'package:commitment_client/service/commitment_service.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:commitment_client/provider/commitment_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(
    MultiProvider(
      providers: [
        Provider<ApiClient>(
          create: (_) => ApiClient(),
        ),
        ProxyProvider<ApiClient, CommitmentService>(
          update: (_, apiClient, __) => CommitmentService(apiClient),
        ),
      ],
      child: const CommitmentApp(),
    ),
  );
}

class CommitmentApp extends StatelessWidget {
  const CommitmentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CommitmentProvider(),
        child: MaterialApp(
            title: 'Commitment',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: SplashScreen()));
  }
}
