import 'package:flutter/material.dart';

class AppBarThemeConfig {
  static AppBarTheme get darkAppBarTheme {
    return const AppBarTheme(
      backgroundColor: Color(0xFF1E1E26),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    );
  }

  static AppBarTheme get lightAppBarTheme {
    return const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
