import 'package:flip_coin/app/core/custom/staggered_dot_wave_loader.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isLoading;
  final Color? color;
  final Color? borderColor;
  final double? radius;
  const AppButton(
      {super.key,
        required this.onPressed,
        required this.title,
        this.color,
        this.borderColor,
        this.isLoading = false,
        this.radius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
            if (states.contains(WidgetState.disabled)) {
              return color ?? AppPaletteLight.primary.withOpacity(0.5);
            }
            return color ?? AppPaletteLight.primary;
          },
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 0.0),
          ),
        ),
        side: WidgetStateProperty.all(
          BorderSide(
            color: borderColor ?? AppPaletteLight.primary,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Center(
          child: isLoading == true
              ? const StaggeredDotsWave(
            color: AppPaletteLight.onPrimary,
            size: 40,
          )
              : Text(
            title,
            style: context.themeData.textTheme.labelLarge
                ?.copyWith(color: AppPaletteLight.onPrimary),
          )),
    );
  }
}

class CommonButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final double? radius;
  final Color? backgroundColor;
  final Color? borderColor;
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.radius,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? AppPaletteLight.primary,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.0),
          ),
        ),
        side: WidgetStateProperty.all(
          BorderSide(
            color: borderColor ?? AppPaletteLight.primary,
          ),
        ),
      ),
      child: child,
    );
  }
}
