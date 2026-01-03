import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF0D4F7C),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0D4F7C),
      foregroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.grey[100],
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );
}
