import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off_rounded,
            size: 80,
            color: AppPaletteLight.primary,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            texts.noInternet,
            textAlign: TextAlign.center,
            style: context.themeData.textTheme.labelLarge?.copyWith(
              color: AppPaletteLight.primary,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            texts.checkInternet,
            textAlign: TextAlign.center,
            style: context.themeData.textTheme.labelLarge?.copyWith(
              color: AppPaletteLight.primary,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
