part of "../theme.dart";

var _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    shape: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        );
      }
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      );
    }),
    textStyle: WidgetStateTextStyle.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return _textTheme.labelLarge!
            .copyWith(color: AppPaletteLight.onPrimary);
      }
      return _textTheme.labelLarge!.copyWith(color: AppPaletteLight.onPrimary);
    }),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppPaletteLight.primaryContainer.withOpacity(0.3);
      }
      return AppPaletteLight.primaryContainer;
    }),
  ),
);
