import 'package:flutter/material.dart';

class DividerThemeConfig {
  static DividerThemeData get darkDividerTheme {
    return const DividerThemeData(
      color: Color(0xFF2C2C34),
      thickness: 1,
    );
  }

  static DividerThemeData get lightDividerTheme {
    return const DividerThemeData(
      color: Color(0xFFE5E5E5),
      thickness: 1,
    );
  }
}
