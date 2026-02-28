import 'package:flutter/material.dart';
import 'font_size.dart';

class AppTextStyles {
  static TextStyle displayLarge = TextStyle(
    fontSize: AppFontSize.of(28),
    fontWeight: FontWeight.bold,
  );
  static TextStyle displayMedium = TextStyle(
    fontSize: AppFontSize.of(22),
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleLarge = TextStyle(
    fontSize: AppFontSize.of(18),
    fontWeight: FontWeight.w600,
  );
  static TextStyle titleMedium = TextStyle(
    fontSize: AppFontSize.of(15),
    fontWeight: FontWeight.w500,
  );
  static TextStyle bodyLarge = TextStyle(
    fontSize: AppFontSize.of(14),
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodySmall = TextStyle(
    fontSize: AppFontSize.of(12),
    color: Colors.grey,
  );
  static TextStyle labelLarge = TextStyle(
    fontSize: AppFontSize.of(13),
    fontWeight: FontWeight.w500,
  );
}
