import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/auth/presentation/register/register_body.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppPaletteLight.bgColor,
        body: Stack(
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
            const RegisterBody(),


          ],
        ),
      ),
    );
  }
}
