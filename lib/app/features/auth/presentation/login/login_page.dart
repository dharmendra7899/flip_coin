import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/auth/presentation/login/login_mobile_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppPaletteLight.bgColor,
        body: loginBody(context),
      ),
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
        LoginMobileBody(),
      ],
    );
  }
}
