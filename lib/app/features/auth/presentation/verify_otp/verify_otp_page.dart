import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/auth/presentation/verify_otp/verify_otp_body.dart';
import 'package:flutter/material.dart';

class VerifyOTPPage extends StatefulWidget {
  const VerifyOTPPage({super.key});

  @override
  State<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          backgroundColor: AppPaletteLight.bgColor,
          body: loginBody(context)),
    );
  }

  Widget loginBody(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Image.asset(
                'assets/images/login_bg.png',
                fit: BoxFit.contain,
              ),
            )),
        OTPVerificationBody(),
        Positioned(
          top: 35,
          left: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ],
    );
  }
}
