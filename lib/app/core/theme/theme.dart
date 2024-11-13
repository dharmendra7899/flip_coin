import 'package:flutter/material.dart';
import 'app_palette.dart';

part 'widget/app_bar_theme.dart';
part 'widget/bottom_sheet_theme.dart';
part 'widget/check_box_theme.dart';
part 'widget/divider_theme.dart';
part 'widget/elevated_button_theme.dart';
part 'widget/expansion_tile_theme.dart';
part 'widget/input_decoration_theme.dart';
part 'widget/search_bar_theme.dart';
part 'widget/text_theme.dart';
part 'widget/tooltip_theme.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark();
  static final lightThemeMode = ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    scaffoldBackgroundColor: AppPaletteLight.surface,
    inputDecorationTheme: _inputDecorationTheme,
    textTheme: _textTheme,
    dividerTheme: _dividerTheme,
    bottomSheetTheme: _bottomSheetTheme,
    appBarTheme: _appBarTheme,
    checkboxTheme: _checkBoxTheme,
    searchBarTheme: _searchBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    expansionTileTheme: _expansionTileTheme,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppPaletteLight.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: AppPaletteLight.greenColor,
            width: 4,
          ),
        ),
      ),
    ),
    tooltipTheme: _tooltipTheme,
  );
}
