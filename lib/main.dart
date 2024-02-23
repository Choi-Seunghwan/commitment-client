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
            primarySwatch: Colors.yellow,
            hintColor: Colors.white,
            scaffoldBackgroundColor: Colors.black,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
            ),
            colorScheme: ColorScheme.fromSwatch(
              brightness: Brightness.dark,
              primarySwatch: Colors.yellow,
            ).copyWith(secondary: Colors.yellow.shade400),
            useMaterial3: false,
            // inputDecorationTheme: const InputDecorationTheme(
            //     border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            //     enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            //     labelStyle: TextStyle(color: Colors.white)),

            // sliderTheme: SliderThemeData(
            //   activeTrackColor: Colors.yellow.shade400,
            //   thumbColor: Colors.yellow.shade400,
            //   overlayColor: Colors.yellow.shade400.withOpacity(0.2),
            // ),

            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.yellow.shade400; // 선택된 상태
                  }
                  return Colors.grey.shade800; // 비선택된 상태
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) return Colors.black; // 선택된 상태의 글자 색상
                  return Colors.white; // 비선택된 상태의 글자 색상
                },
              ),
            ))),
        home: const SplashInitPage());
  }
}
