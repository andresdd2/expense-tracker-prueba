import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color cBg = Color(0xFF121212); // casi negro
  static const Color cAccent = Color(0xFF288288); // teal oscuro
  static const Color cCard = Color(0xFF404040); // gris oscuro
  static const Color cText = Color(0xFFA3A3A3); // gris claro (texto)

  static ThemeData get dark {
    final base = ThemeData(useMaterial3: true, brightness: Brightness.dark);
    return base.copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: cAccent,
        onPrimary: cText, 
        secondary: cAccent,
        onSecondary: cText,
        background: cBg,
        onBackground: cText,
        surface: cCard,
        onSurface: cText,
        error: cAccent, // no hay rojo → reusa acento
        onError: cText,
        surfaceTint: Colors.transparent,
        tertiary: cCard, // opcional
        onTertiary: cText,
        primaryContainer: cCard,
        onPrimaryContainer: cText,
        secondaryContainer: cCard,
        onSecondaryContainer: cText,
        tertiaryContainer: cCard,
        onTertiaryContainer: cText,
        inversePrimary: cAccent,
        inverseSurface: cBg,
        onInverseSurface: cText,
        outline: cCard,
        shadow: cBg,
        scrim: cBg,
      ),
      scaffoldBackgroundColor: cBg,
      dividerColor: cCard,
      textTheme: GoogleFonts.interTextTheme(
        base.textTheme,
      ).apply(bodyColor: cText, displayColor: cText),
      appBarTheme: const AppBarTheme(
        backgroundColor: cBg,
        foregroundColor: cText,
        centerTitle: false,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: cCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cCard,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintStyle: TextStyle(color: cText.withOpacity(.7)),
        labelStyle: const TextStyle(color: cText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: cCard, width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: cCard, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: cAccent, width: 1.6),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: cAccent,
          foregroundColor: cText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: cAccent,
          foregroundColor: cText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: cAccent,
        foregroundColor: cText,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: cBg,
        surfaceTintColor: Colors.transparent,
        indicatorColor: cAccent.withOpacity(.25),
        iconTheme: WidgetStateProperty.resolveWith(
          (s) => IconThemeData(
            color: s.contains(WidgetState.selected)
                ? cText
                : cText.withOpacity(.7),
          ),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (s) => TextStyle(
            color: s.contains(WidgetState.selected)
                ? cText
                : cText.withOpacity(.7),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
