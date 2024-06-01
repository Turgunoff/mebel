import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme Colors
  static const Color lightPrimaryColor = Color(0xFF013C7E);
  static const Color lightSecondaryColor = Color(0xFF0077cc);
  static const Color lightBackgroundColor = Colors.white;
  static const Color lightScaffoldBackgroundColor = Color(0xFFF9F9F9);
  static const Color lightTextColor = Colors.black;
  static final Color lightHintColor = Colors.grey[400]!;
  static const Color lightIconColor = Colors.black;
  static const Color lightPrimaryTextColor = Colors.black;
  static final Color lightSecondaryTextColor = Colors.grey[600]!;
  static const Color lightCardBackgroundColor = Colors.white;

  // Dark Theme Colors
  static const Color darkPrimaryColor = Color(0xFF013C7E);
  static const Color darkSecondaryColor = Color(0xFF005fa3);
  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color darkScaffoldBackgroundColor = Color(0xFF1E1E1E);
  static const Color darkTextColor = Colors.white;
  static final Color darkHintColor = Colors.grey[600]!;
  static const Color darkIconColor = Colors.white;
  static const Color darkPrimaryTextColor = Colors.white;
  static Color darkSecondaryTextColor = Colors.grey[400]!;
  static Color darkCardBackgroundColor = Colors.grey[800]!;

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
        primaryColor: lightPrimaryColor,
        colorScheme: const ColorScheme.light(
          primary: lightPrimaryColor,
          secondary: lightSecondaryColor,
          background: lightBackgroundColor,
        ),
        scaffoldBackgroundColor: lightScaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: lightBackgroundColor,
          foregroundColor: lightTextColor,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: lightTextColor),
          bodyLarge: TextStyle(color: lightTextColor),
          bodyMedium: TextStyle(color: lightTextColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: lightHintColor),
        ),
        iconTheme: const IconThemeData(color: lightIconColor),
        cardTheme: const CardTheme(
          color: lightCardBackgroundColor,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: darkPrimaryColor,
        colorScheme: const ColorScheme.dark(
          primary: darkPrimaryColor,
          secondary: darkSecondaryColor,
          background: darkBackgroundColor,
        ),
        scaffoldBackgroundColor: darkScaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: darkBackgroundColor,
          foregroundColor: darkTextColor,
          elevation: 0,
        ),
        textTheme: TextTheme(
          titleLarge: const TextStyle(color: darkPrimaryTextColor),
          bodyLarge: const TextStyle(color: darkPrimaryTextColor),
          bodyMedium: TextStyle(color: darkSecondaryTextColor),
        ),
        iconTheme: const IconThemeData(color: darkIconColor),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: darkHintColor),
        ),
        cardTheme: CardTheme(
          color: darkCardBackgroundColor,
        ),
      );
}
