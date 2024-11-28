import 'dart:io';

import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DesignConfiguration {
  static setSvgPath(String name) {
    return 'assets/svg/$name.svg';
  }
  static setPngPath(String name) {
    return 'assets/images/png/$name.png';
  }

  static setLottiePath(String name) {
    return 'assets/animation/$name.json';
  }

  static erroWidget(double size) {
    return Image.asset(
      DesignConfiguration.setPngPath('placeholder'),
      height: size,
      width: size,
    );
  }

  static shadow() {
    return const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color(0x1a0400ff),
          offset: Offset(0, 0),
          blurRadius: 30,
        )
      ],
    );
  }

  static back() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppPaletteLight.grad1Color, AppPaletteLight.grad2Color],
        stops: [0, 1],
      ),
    );
  }

  static imagePlaceHolder(double size, BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Icon(
        Icons.account_circle,
        color: AppPaletteLight.black,
        size: size,
      ),
    );
  }

  static String? getPriceFormat(BuildContext context, double price) {
    return NumberFormat.currency(
      locale: Platform.localeName,
      name: 'Ind',
      symbol: '₹',
      // decimalDigits: int.parse(DECIMAL_POINTS ?? '0'),
    ).format(price).toString();
  }

  static getProgress() {
    return const Center(child: CircularProgressIndicator());
  }

  static getNoItem(BuildContext context) {
    return Center(
      child: Text(
        texts.noItem,
        style: context.themeData.textTheme.bodyLarge
            ?.copyWith(color: AppPaletteLight.background),
      )

    );
  }

  static Widget showCircularProgress(bool isProgress, Color color) {
    if (isProgress) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      );
    }
    return const SizedBox(
      height: 0.0,
      width: 0.0,
    );
  }

  static dialogAnimate(BuildContext context, Widget dialge) {
    return showGeneralDialog(
      barrierColor: AppPaletteLight.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(opacity: a1.value, child: dialge),
        );
      },
      transitionDuration: const Duration(milliseconds: 250),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      },
    );
  }

  static getCacheNotworkImage({
    required String imageurlString,
    required BuildContext context,
    required BoxFit? boxFit,
    required double? heightvalue,
    required double? widthvalue,
    required double? placeHolderSize,
  }) {
    return FadeInImage.assetNetwork(
      image: imageurlString,
      placeholder:  DesignConfiguration.setPngPath('placeholder'),
      width: widthvalue,
      height: heightvalue,
      fit: boxFit,
      fadeInDuration: const Duration(
        milliseconds: 150,
      ),
      fadeOutDuration: const Duration(
        milliseconds: 150,
      ),
      fadeInCurve: Curves.linear,
      fadeOutCurve: Curves.linear,
      imageErrorBuilder: (context, error, stackTrace) {
        return Container(
          child: DesignConfiguration.erroWidget(placeHolderSize ?? 50),
        );
      },
    );

  }
}