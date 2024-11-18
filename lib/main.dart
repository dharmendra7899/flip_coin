import 'dart:io';

import 'package:flip_coin/app/core/theme/theme.dart';
import 'package:flip_coin/app/features/auth/auth_provider.dart';
import 'package:flip_coin/app/features/splash/splash_screen.dart';
import 'package:flip_coin/custom_providers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  final state = AuthProvider(await SharedPreferences.getInstance());

  runApp(CustomProvider(
    loginState: state,
    child: const MyApp(),
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flip Coin',
      localeResolutionCallback: (local, supportedLocales) {
        for (final locale in supportedLocales) {
          if (locale.languageCode == locale.languageCode &&
              locale.countryCode == locale.countryCode) {
            return locale;
          }
        }
        return supportedLocales.first;
      },
      theme: AppTheme.lightThemeMode,
      darkTheme: AppTheme.lightThemeMode,
      home: const SplashScreen(),
    );
  }
}
