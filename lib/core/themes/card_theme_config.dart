import 'package:flutter/material.dart';

class CardThemeConfig {
  static CardThemeData get darkCardTheme {
    return CardThemeData(
      color: const Color(0xFF1E1E26),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
    );
  }

  static CardThemeData get lightCardTheme {
    return CardThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.05),
    );
  }
}
