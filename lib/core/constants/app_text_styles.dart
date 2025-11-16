import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // Font Family
  static String get fontFamily => GoogleFonts.inter().fontFamily!;

  // Heading Styles
  static TextStyle heading1Light = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF000000),
    height: 1.2,
  );

  static TextStyle heading1Dark = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFFFFFFF),
    height: 1.2,
  );

  static TextStyle heading2Light = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF000000),
    height: 1.3,
  );

  static TextStyle heading2Dark = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFFFFFFF),
    height: 1.3,
  );

  static TextStyle heading3Light = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
    height: 1.4,
  );

  static TextStyle heading3Dark = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
    height: 1.4,
  );

  // Title Styles
  static TextStyle titleLargeLight = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
  );

  static TextStyle titleLargeDark = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle titleMediumLight = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
  );

  static TextStyle titleMediumDark = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle titleSmallLight = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
  );

  static TextStyle titleSmallDark = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

  // Body Styles
  static TextStyle bodyLargeLight = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: const Color(0xFF000000),
    height: 1.5,
  );

  static TextStyle bodyLargeDark = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: const Color(0xFFFFFFFF),
    height: 1.5,
  );

  static TextStyle bodyMediumLight = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: const Color(0xFF000000),
    height: 1.5,
  );

  static TextStyle bodyMediumDark = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: const Color(0xFFFFFFFF),
    height: 1.5,
  );

  static TextStyle bodySmallLight = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: const Color(0xFF757575),
    height: 1.5,
  );

  static TextStyle bodySmallDark = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: const Color(0xFFB0B0B0),
    height: 1.5,
  );

  // Label Styles
  static TextStyle labelLargeLight = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF000000),
  );

  static TextStyle labelLargeDark = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle labelMediumLight = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF757575),
  );

  static TextStyle labelMediumDark = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFB0B0B0),
  );

  static TextStyle labelSmallLight = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF757575),
  );

  static TextStyle labelSmallDark = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFB0B0B0),
  );

  // Button Styles
  static TextStyle buttonLargeLight = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle buttonLargeDark = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
  );

  static TextStyle buttonMediumLight = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle buttonMediumDark = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
  );

  // Amount Styles
  static TextStyle amountLargeLight = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF000000),
  );

  static TextStyle amountLargeDark = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle amountMediumLight = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
  );

  static TextStyle amountMediumDark = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

  static TextStyle amountSmallLight = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
  );

  static TextStyle amountSmallDark = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

  // Caption Style
  static TextStyle captionLight = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: const Color(0xFFBDBDBD),
  );

  static TextStyle captionDark = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: const Color(0xFF757575),
  );

  // Overline Style
  static TextStyle overlineLight = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF757575),
    letterSpacing: 1.5,
  );

  static TextStyle overlineDark = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFB0B0B0),
    letterSpacing: 1.5,
  );
}
