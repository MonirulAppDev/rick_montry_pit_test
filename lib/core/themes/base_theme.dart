import 'package:flutter/material.dart';
import 'appbar_theme.dart';
import 'text_theme.dart';
import 'color_scheme_config.dart';
import 'card_theme_config.dart';
import 'divider_theme_config.dart';

class BaseTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF13131A),
      primaryColor: const Color(0xFF9D50BB),
      colorScheme: ColorSchemeConfig.darkColorScheme,
      appBarTheme: AppBarThemeConfig.darkAppBarTheme,
      textTheme: AppTextTheme.darkTextTheme,
      cardTheme: CardThemeConfig.darkCardTheme,
      dividerTheme: DividerThemeConfig.darkDividerTheme,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF5F5F7),
      primaryColor: const Color(0xFF9D50BB),
      colorScheme: ColorSchemeConfig.lightColorScheme,
      appBarTheme: AppBarThemeConfig.lightAppBarTheme,
      textTheme: AppTextTheme.lightTextTheme,
      cardTheme: CardThemeConfig.lightCardTheme,
      dividerTheme: DividerThemeConfig.lightDividerTheme,
    );
  }
}
