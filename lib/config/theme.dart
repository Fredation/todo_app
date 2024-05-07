import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/config/app_colors.dart';

/// Default [ThemeData] for TodoApp
class AppTheme {
  /// Default constructor for TodoApp [ThemeData]
  AppTheme();

  /// Exposes theme data to MaterialApp
  ThemeData get themeData {
    return ThemeData().copyWith(
      colorScheme: _colorScheme,
      scaffoldBackgroundColor: _colorScheme.background,
      dividerTheme: DividerThemeData(
        color: _colorScheme.secondary,
        thickness: .5,
      ),
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(
          color: _colorScheme.secondary,
        ),
        backgroundColor: _colorScheme.background,
        centerTitle: true,
        titleTextStyle: GoogleFonts.roboto(
            height: 1.5,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: _colorScheme.secondary,
            letterSpacing: -.2),
      ),
      textTheme: GoogleFonts.robotoTextTheme(
        TextTheme(
          headlineMedium: GoogleFonts.roboto(
            height: 1.2,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          headlineSmall: GoogleFonts.roboto(
            fontSize: 25,
            fontWeight: FontWeight.w100,
            height: 1.1,
            letterSpacing: 0.14,
          ),
          titleLarge: GoogleFonts.roboto(
            height: 1.1,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
          ),
          titleMedium: GoogleFonts.roboto(
            height: 1.1,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          bodySmall: GoogleFonts.roboto(
            height: 1.1,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: GoogleFonts.roboto(
            height: 1.1,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: GoogleFonts.roboto(
            height: 1.1,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  ColorScheme get _colorScheme => ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      background: AppColors.background);
}
