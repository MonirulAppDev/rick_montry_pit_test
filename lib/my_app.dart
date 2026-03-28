import 'package:flutter/material.dart';
import 'core/themes/base_theme.dart';
import 'features/character/presentation/pages/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty Clean Architecture',
      debugShowCheckedModeBanner: false,
      theme: BaseTheme.lightTheme,
      darkTheme: BaseTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const MainPage(),
    );
  }
}
