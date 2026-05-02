import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color pdark = Color(0xFF181818);
  static const Color sdark = Color(0xFF212121);
  static const Color selected = Color(0xFF2A2A2A);
  static const Color newPurple = Color(0xFFC0A9FF);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF9E9E9E);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: sdark,

    textTheme: TextTheme(
      displayLarge: GoogleFonts.epilogue(
        fontSize: 28,
        // fontWeight: FontWeight.bold,
        color: textPrimary,
      ),
      titleMedium: GoogleFonts.beVietnamPro(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      bodyMedium: GoogleFonts.beVietnamPro(fontSize: 14, color: textSecondary),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.05),
      hintStyle: GoogleFonts.beVietnamPro(color: textSecondary, fontSize: 14),
      prefixIconColor: textSecondary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none
      ),
    ),

    cardTheme: CardThemeData(
      color: Color(0x0AFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
    ),

    colorScheme: const ColorScheme.dark(
      primary: newPurple,
      surface: selected,
      onSurface: textPrimary,
    ),
  );
}
