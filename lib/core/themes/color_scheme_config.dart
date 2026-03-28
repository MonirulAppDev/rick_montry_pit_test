import 'package:flutter/material.dart';

class ColorSchemeConfig {
  static ColorScheme get darkColorScheme {
    return ColorScheme.fromSeed(
      seedColor: const Color(0xFF9D50BB),
      brightness: Brightness.dark,
      surface: const Color(0xFF1E1E26),
      primary: const Color(0xFF9D50BB),
      secondary: const Color(0xFF6E48AA),
    );
  }

  static ColorScheme get lightColorScheme {
    return ColorScheme.fromSeed(
      seedColor: const Color(0xFF9D50BB),
      brightness: Brightness.light,
      surface: Colors.white,
      primary: const Color(0xFF9D50BB),
      secondary: const Color(0xFF6E48AA),
    );
  }
}
