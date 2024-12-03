import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/core/utils/preferences.dart';
import 'package:flip_coin/app/features/auth/presentation/login/login_page.dart';
import 'package:flip_coin/app/features/walk_through/walk_through_screen.dart';
import 'package:flip_coin/app/routes/navigation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigation() async {
    await Future.delayed(const Duration(seconds: 3));
    final isOnboardingCompleted =
        await SharedPreferencesSessionManager.getBool(key: "onboarding");
    if (mounted) {
      navigateRemoveUntil(
        context: context,
        to: isOnboardingCompleted ? const LoginPage() : const Walkthrough(),
      );
    }
  }

  @override
  void initState() {
    _navigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPaletteLight.background,
      body: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image.asset(
              ConstantImage.appLogo,
              scale: 4,
            )),
      ),
    );
  }
}
