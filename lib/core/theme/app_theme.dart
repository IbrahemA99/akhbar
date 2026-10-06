import 'package:flutter/material.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightTheme.background,
    primaryColor: LightTheme.primary,

    appBarTheme: const AppBarTheme(
    backgroundColor: LightTheme.background,
  ),

     colorScheme: const ColorScheme.light(
    primary: LightTheme.primary,
    onSurface: LightTheme.text,
    outline: LightTheme.border,
  
  ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkTheme.background,
    primaryColor: DarkTheme.primary,
    appBarTheme: const AppBarTheme(
    backgroundColor: DarkTheme.background,
  ),

      colorScheme: const ColorScheme.dark(
    primary: DarkTheme.primary,
    onSurface: DarkTheme.text,
    outline: DarkTheme.border,
  ),
  );
}