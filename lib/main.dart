import 'package:commitment_client/provider/auth_provider.dart';
import 'package:commitment_client/provider/commitment_provider.dart';
import 'package:commitment_client/screens/splash_init_page.dart';
import 'package:commitment_client/service/api_client.dart';
import 'package:commitment_client/service/auth_service.dart';
import 'package:commitment_client/service/commitment_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env.dev");
  // await dotenv.load(fileName: ".env.prod");

  runApp(
    MultiProvider(
      providers: [
        Provider<ApiClient>(
          create: (_) => ApiClient(),
        ),
        ProxyProvider<ApiClient, CommitmentService>(
          update: (_, apiClient, __) => CommitmentService(apiClient),
        ),
        ChangeNotifierProxyProvider<CommitmentService, CommitmentProvider>(
          create: (context) =>
              CommitmentProvider(Provider.of<CommitmentService>(context, listen: false)),
          update: (context, commitmentService, previous) => CommitmentProvider(commitmentService),
        ),
        ProxyProvider<ApiClient, AuthService>(update: (_, apiClient, __) => AuthService(apiClient)),
        ChangeNotifierProxyProvider<AuthService, AuthProvider>(
          create: (context) => AuthProvider(Provider.of<AuthService>(context, listen: false)),
          update: (context, authService, previous) => AuthProvider(authService),
        ),
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
          brightness: Brightness.dark,
          primaryColor: Colors.yellow.shade400,
          hintColor: Colors.white,
          scaffoldBackgroundColor: Colors.black,
          cardColor: Colors.grey[900],
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            // 다른 텍스트 스타일도 여기에 추가할 수 있습니다.
          ),
          useMaterial3: true,
        ),
        home: const SplashInitPage());
  }
}
