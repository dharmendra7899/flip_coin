import 'package:intl/intl.dart';

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
extension AppStringExtensions on String {
  String get capitalize => "${this[0].toUpperCase()}${substring(1)}";

  String get isValidEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this) ? this : '';

  String get isValidName => length > 3 ? this : '';

  bool get isValidMobileNumber => RegExp(r'^[0-9]{10}$').hasMatch(this);

  String formatDate() {
    if (isEmpty) {
      return '';
    }
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('MMMM d, yyyy \'at\' h:mm a').format(dateTime);
    } catch (e) {
      return ''; // Handle parsing errors
    }
  }
}
