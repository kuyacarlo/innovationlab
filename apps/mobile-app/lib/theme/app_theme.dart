/// ============================================================
/// ANI-SABI — App Theme
/// ============================================================
/// Material 3 earthy / organic colour palette:
///   • Forest greens  — primary
///   • Soil browns    — secondary & tertiary
///   • Clean whites   — surfaces
///
/// Typography is handled via Google Fonts (Nunito for body,
/// Playfair Display for headlines) to give the app a warm,
/// trustworthy feel during the pitch.
/// ============================================================

import 'package:flutter/material.dart';

// ─── colour tokens ───────────────────────────────────────────

/// Deep forest green — hero colour for toolbars and CTAs.
const Color kForestGreen = Color(0xFF2D6A4F);

/// Lighter sage green — secondary surfaces, chips, tags.
const Color kSageGreen = Color(0xFF52B788);

/// Rich soil brown — accent, icons, warm highlights.
const Color kSoilBrown = Color(0xFF7B5B3A);

/// Light parchment — light background surfaces.
const Color kParchment = Color(0xFFFDF6EC);

/// Off-white — card surfaces.
const Color kOffWhite = Color(0xFFFFFBF5);

/// Alert red for TANGGOL-SAKA.
const Color kAlertRed = Color(0xFFD62828);

/// Sunshine amber for warnings / highlights.
const Color kAmber = Color(0xFFF4A261);

// ─── theme builder ───────────────────────────────────────────

ThemeData buildAniSabiTheme() {
  // Base colour scheme seeded from our forest green.
  final colorScheme = ColorScheme.fromSeed(
    seedColor: kForestGreen,
    primary: kForestGreen,
    secondary: kSoilBrown,
    tertiary: kSageGreen,
    surface: kOffWhite,
    brightness: Brightness.light,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: kParchment,

    // ── App Bar ──────────────────────────────────────────────
    appBarTheme: AppBarTheme(
      backgroundColor: kForestGreen,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontFamily: 'Serif',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),

    // ── Bottom Nav Bar ───────────────────────────────────────
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kForestGreen,
      unselectedItemColor: Colors.grey.shade500,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // ── Cards ────────────────────────────────────────────────
    cardTheme: CardThemeData(
      color: kOffWhite,
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // ── Buttons ──────────────────────────────────────────────
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kForestGreen,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),

    // ── Text Theme ───────────────────────────────────────────
    textTheme: TextTheme(
      displayLarge: const TextStyle(fontFamily: 'Serif', fontSize: 32, fontWeight: FontWeight.w800, color: kForestGreen),
      displayMedium: const TextStyle(fontFamily: 'Serif', fontSize: 26, fontWeight: FontWeight.w700, color: kForestGreen),
      headlineLarge: const TextStyle(fontFamily: 'Serif', fontSize: 22, fontWeight: FontWeight.w700, color: kForestGreen),
      headlineMedium: const TextStyle(fontFamily: 'Serif', fontSize: 20, fontWeight: FontWeight.w600, color: kSoilBrown),
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: kSoilBrown),
      titleLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      bodyLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey.shade600),
      labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    ),
  );
}
