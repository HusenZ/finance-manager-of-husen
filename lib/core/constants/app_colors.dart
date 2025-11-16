import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF6200EE);
  static const Color primaryDark = Color(0xFF3700B3);
  static const Color primaryLight = Color(0xFFBB86FC);

  // Secondary Colors
  static const Color secondary = Color(0xFF03DAC6);
  static const Color secondaryDark = Color(0xFF018786);
  static const Color secondaryLight = Color(0xFF66FFF9);

  // Background Colors - Light Mode
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);

  // Background Colors - Dark Mode
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color cardDark = Color(0xFF2C2C2C);

  // Text Colors - Light Mode
  static const Color textPrimaryLight = Color(0xFF000000);
  static const Color textSecondaryLight = Color(0xFF757575);
  static const Color textHintLight = Color(0xFFBDBDBD);

  // Text Colors - Dark Mode
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  static const Color textHintDark = Color(0xFF757575);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Category Colors
  static const Color categoryFood = Color(0xFF4CAF50);
  static const Color categoryEntertainment = Color(0xFFFF9800);
  static const Color categoryTransport = Color(0xFF2196F3);
  static const Color categoryShopping = Color(0xFFE91E63);
  static const Color categoryBills = Color(0xFF9C27B0);
  static const Color categoryHealthcare = Color(0xFFF44336);
  static const Color categoryEducation = Color(0xFF3F51B5);
  static const Color categoryUtilities = Color(0xFFFF5722);
  static const Color categoryOther = Color(0xFF607D8B);

  // Chart Colors
  static const List<Color> chartColors = [
    Color(0xFF4CAF50),
    Color(0xFFFF9800),
    Color(0xFF2196F3),
    Color(0xFFE91E63),
    Color(0xFF9C27B0),
    Color(0xFFF44336),
    Color(0xFF3F51B5),
    Color(0xFFFF5722),
    Color(0xFF607D8B),
    Color(0xFF00BCD4),
    Color(0xFF8BC34A),
    Color(0xFFFFEB3B),
  ];

  // Transaction Type Colors
  static const Color income = Color(0xFF4CAF50);
  static const Color expense = Color(0xFFF44336);

  // Budget Status Colors
  static const Color budgetOnTrack = Color(0xFF4CAF50);
  static const Color budgetWarning = Color(0xFFFF9800);
  static const Color budgetExceeded = Color(0xFFF44336);

  // Divider Colors
  static const Color dividerLight = Color(0xFFE0E0E0);
  static const Color dividerDark = Color(0xFF424242);

  // Border Colors
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF424242);

  // Shimmer Colors - Light Mode
  static const Color shimmerBaseLight = Color(0xFFE0E0E0);
  static const Color shimmerHighlightLight = Color(0xFFF5F5F5);

  // Shimmer Colors - Dark Mode
  static const Color shimmerBaseDark = Color(0xFF424242);
  static const Color shimmerHighlightDark = Color(0xFF616161);

  // Shadow Colors
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowDark = Color(0x3D000000);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF4CAF50), Color(0xFF388E3C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warningGradient = LinearGradient(
    colors: [Color(0xFFFF9800), Color(0xFFF57C00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient errorGradient = LinearGradient(
    colors: [Color(0xFFF44336), Color(0xFFD32F2F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Helper method to get category color by name
  static Color getCategoryColor(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'food':
        return categoryFood;
      case 'entertainment':
        return categoryEntertainment;
      case 'transport':
        return categoryTransport;
      case 'shopping':
        return categoryShopping;
      case 'bills':
        return categoryBills;
      case 'healthcare':
        return categoryHealthcare;
      case 'education':
        return categoryEducation;
      case 'utilities':
        return categoryUtilities;
      default:
        return categoryOther;
    }
  }

  // Helper method to get budget status color
  static Color getBudgetStatusColor(double percentage) {
    if (percentage >= 1.0) {
      return budgetExceeded;
    } else if (percentage >= 0.8) {
      return budgetWarning;
    } else {
      return budgetOnTrack;
    }
  }
}
