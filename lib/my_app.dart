import 'package:flutter/material.dart';
import 'features/character/presentation/pages/character_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty Clean Architecture',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1E1E26),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9D50BB),
          brightness: Brightness.dark,
          surface: const Color(0xFF2C2C34),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E26),
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      home: const CharacterPage(),
    );
  }
}
