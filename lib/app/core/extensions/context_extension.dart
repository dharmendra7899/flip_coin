import 'package:flutter/material.dart';

/// An extension on `BuildContext` that provides convenient access to common properties.
///
/// This extension adds the following properties:
/// - `themeData`: Returns the current theme data of the app.
/// - `height`: Returns the height of the current media query.
/// - `width`: Returns the width of the current media query.
///
/// Example usage:
/// ```dart
/// ThemeData theme = context.themeData;
/// ColorScheme colorScheme = context.colorScheme;
/// double screenHeight = context.height;
/// double screenWidth = context.width;
/// ```
extension AppContextExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);

  ColorScheme get colorScheme => themeData.colorScheme;

  TextTheme get textTheme => themeData.textTheme;

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double get statusBarHeight => MediaQuery.of(this).padding.top;
}
