import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme Colors
  static const Color _lightPrimaryColor = Color(0xFF013C7E);
  static const Color _lightSecondaryColor =
      Color(0xFF0077cc); // Asosiy rangning ochroq varianti
  static const Color _lightBackgroundColor = Colors.white;
  static const Color _lightScaffoldBackgroundColor = Color(0xFFF9F9F9);
  static const Color _lightTextColor = Colors.black;
  static final Color _lightHintColor = Colors.grey[400]!;

  // Dark Theme Colors
  static const Color _darkPrimaryColor =
      Color(0xFF013C7E); // Asosiy rangni qoraytirilgan varianti
  static const Color _darkSecondaryColor =
      Color(0xFF005fa3); // Asosiy rangning yanada qoraytirilgan varianti
  static const Color _darkBackgroundColor = Color(0xFF121212);
  static const Color _darkScaffoldBackgroundColor = Color(0xFF1E1E1E);
  static const Color _darkTextColor = Colors.white;
  static final Color _darkHintColor = Colors.grey[600]!;

  // Shared Colors
  static const Color discountColor = Color(0xFFA20317);
  static const Color starColor = Color(0xFFF6B71C);

  // Qo'shimcha ranglar
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFF44336);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color infoColor = Color(0xFF2196F3);

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
        inputDecorationTheme: InputDecorationTheme(
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
