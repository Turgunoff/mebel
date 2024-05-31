import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme Colors
  static const Color _lightPrimaryColor = Colors.blue;
  static const Color _lightSecondaryColor = Colors.lightBlueAccent;
  static const Color _lightBackgroundColor = Colors.white;
  static const Color _lightScaffoldBackgroundColor = Color(0xFFF9F9F9);
  static const Color _lightTextColor = Colors.black;
  static const Color _lightHintColor = Colors.grey;

  // Dark Theme Colors
  static const Color _darkPrimaryColor = Colors.grey;
  static const Color _darkSecondaryColor = Colors.grey;
  static const Color _darkBackgroundColor = Colors.black;
  static final Color _darkScaffoldBackgroundColor = Colors.grey[900]!;
  static const Color _darkTextColor = Colors.white;
  static final Color _darkHintColor = Colors.grey[700]!;

  // Shared Colors
  static const Color discountColor = Color(0xFFA20317);
  static const Color starColor = Color(0xFFF6B71C);

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: _lightPrimaryColor,
        colorScheme: const ColorScheme.light(
          primary: _lightPrimaryColor,
          secondary: _lightSecondaryColor,
          background: _lightBackgroundColor,
        ),
        scaffoldBackgroundColor: _lightScaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: _lightBackgroundColor,
          foregroundColor: _lightTextColor,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: _lightTextColor),
          bodyLarge: TextStyle(color: _lightTextColor),
          bodyMedium: TextStyle(color: _lightTextColor),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: _lightHintColor),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: _darkPrimaryColor,
        colorScheme: const ColorScheme.dark(
          primary: _darkPrimaryColor,
          secondary: _darkSecondaryColor,
          background: _darkBackgroundColor,
        ),
        scaffoldBackgroundColor: _darkScaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: _darkBackgroundColor,
          foregroundColor: _darkTextColor,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: _darkTextColor),
          bodyLarge: TextStyle(color: _darkTextColor),
          bodyMedium: TextStyle(color: _darkTextColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: _darkHintColor),
        ),
      );
}
