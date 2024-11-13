part of "../theme.dart";

final _inputDecorationTheme = InputDecorationTheme(
  border: _outlineInputBorderTheme(color: AppPaletteLight.primary),
  enabledBorder: _outlineInputBorderTheme(color: AppPaletteLight.primary),
  hintStyle: _textTheme.labelLarge,
  focusedBorder: _outlineInputBorderTheme(color: AppPaletteLight.primary),
  focusedErrorBorder: _outlineInputBorderTheme(color: AppPaletteLight.primary),
  errorBorder: _outlineInputBorderTheme(color: AppPaletteLight.error),
);

OutlineInputBorder _outlineInputBorderTheme({required Color color}) =>
    OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
