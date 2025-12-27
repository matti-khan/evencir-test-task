import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

TextTheme _textTheme(Color primary, Color secondary) => TextTheme(
      titleLarge: GoogleFonts.mulish(
          color: primary, fontWeight: FontWeight.w700, fontSize: 18),
      titleMedium: GoogleFonts.mulish(
          color: primary, fontWeight: FontWeight.w600, fontSize: 16),
      titleSmall:
          GoogleFonts.mulish(color: secondary, fontWeight: FontWeight.w500),
      displayLarge: GoogleFonts.mulish(
          color: primary, fontWeight: FontWeight.w800, fontSize: 48),
      displayMedium:
          GoogleFonts.mulish(color: primary, fontWeight: FontWeight.w700),
      displaySmall:
          GoogleFonts.mulish(color: secondary, fontWeight: FontWeight.w500),
      headlineMedium: GoogleFonts.mulish(
          color: primary, fontWeight: FontWeight.w700, fontSize: 24),
      bodyLarge: GoogleFonts.mulish(
          color: primary, fontWeight: FontWeight.w400, fontSize: 16),
      bodyMedium: GoogleFonts.mulish(
          color: secondary, fontWeight: FontWeight.w400, fontSize: 14),
      bodySmall: GoogleFonts.mulish(
          color: secondary, fontWeight: FontWeight.w400, fontSize: 14),
    );

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.darkBg,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryAccent,
    secondary: AppColors.primaryAccent,
    surface: AppColors.darkTileColor,
    background: AppColors.darkBg,
    onSurface: AppColors.darkText,
    onBackground: AppColors.darkText,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkBg,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.mulish(
        color: AppColors.darkText, fontWeight: FontWeight.bold, fontSize: 22),
    iconTheme: const IconThemeData(color: AppColors.darkText),
  ),
  textTheme: _textTheme(AppColors.darkText, AppColors.darkSubtext),
);
