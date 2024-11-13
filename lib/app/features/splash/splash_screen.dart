import 'package:flip_coin/app/core/assets/constant_images.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  {
  _navigation() async {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {

      }
    });
  }

  @override
  void initState() {
    _navigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPaletteLight.primary,
      body: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image.asset(
              ConstantImage.placeHolder,
              scale: 2,
            )),
      ),
    );
  }
}