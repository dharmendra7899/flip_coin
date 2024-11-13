part of '../theme.dart';

final _searchBarTheme = SearchBarThemeData(
  elevation: WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.pressed)) {
        return 0;
      }
      return 0;
    },
  ),
  // backgroundColor:
  //     WidgetStatePropertyAll(AppPaletteLight.primary.withOpacity(0.3)),
  // backgroundColor: WidgetStateProperty.resolveWith(
  //   (states) {
  //     if (states.contains(WidgetState.pressed)) {
  //       return Colors.black.withOpacity(0.3);
  //     }
  //     return AppPaletteLight.surfContainerLow;
  //   },
  // ),
  side: WidgetStateBorderSide.resolveWith(
    (states) {
      if (states.contains(WidgetState.pressed)) {
        return const BorderSide(
          color: AppPaletteLight.surfContainerLow,
        );
      }
      return const BorderSide(
        color: AppPaletteLight.surfContainerLow,
      );
    },
  ),
  shape: WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.pressed)) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        );
      }
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      );
    },
  ),
  textStyle: WidgetStateTextStyle.resolveWith(
    (states) {
      if (states.contains(WidgetState.pressed)) {
        return _textTheme.bodyMedium!.copyWith(
          color: Colors.black,
          fontSize: 14,
        );
      }
      if (states.contains(WidgetState.disabled)) {
        return _textTheme.bodyMedium!.copyWith(
          color: Colors.black,
          fontSize: 14,
        );
      }
      return _textTheme.bodyMedium!.copyWith(
        color: Colors.black,
        fontSize: 14,
      );
    },
  ),
);
