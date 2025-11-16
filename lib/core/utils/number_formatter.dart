import 'package:intl/intl.dart';
import '../constants/app_constants.dart';

class NumberFormatter {
  NumberFormatter._();

  static String formatCurrency(double amount, {String? currency}) {
    final currencySymbol = AppConstants.currencies[currency ?? AppConstants.defaultCurrency] ?? '₹';
    final formatter = NumberFormat('#,##,##0.00', 'en_IN');
    return '$currencySymbol${formatter.format(amount)}';
  }

  static String formatAmount(double amount) {
    final formatter = NumberFormat('#,##,##0.00', 'en_IN');
    return formatter.format(amount);
  }

  static String formatCompactCurrency(double amount, {String? currency}) {
    final currencySymbol = AppConstants.currencies[currency ?? AppConstants.defaultCurrency] ?? '₹';

    if (amount >= 10000000) {
      // Crores
      return '$currencySymbol${(amount / 10000000).toStringAsFixed(2)}Cr';
    } else if (amount >= 100000) {
      // Lakhs
      return '$currencySymbol${(amount / 100000).toStringAsFixed(2)}L';
    } else if (amount >= 1000) {
      // Thousands
      return '$currencySymbol${(amount / 1000).toStringAsFixed(2)}K';
    } else {
      return formatCurrency(amount, currency: currency);
    }
  }

  static String formatPercentage(double value, {int decimals = 1}) {
    return '${value.toStringAsFixed(decimals)}%';
  }

  static double roundToTwoDecimals(double value) {
    return (value * 100).round() / 100;
  }

  static double parseAmount(String amountString) {
    try {
      // Remove currency symbols and commas
      final cleanString = amountString
          .replaceAll(RegExp(r'[₹\$€£¥,\s]'), '')
          .trim();
      return double.parse(cleanString);
    } catch (e) {
      return 0.0;
    }
  }

  static bool isValidAmount(String amountString) {
    try {
      final amount = parseAmount(amountString);
      return amount > 0;
    } catch (e) {
      return false;
    }
  }

  static String formatInteger(int value) {
    final formatter = NumberFormat('#,##,##0', 'en_IN');
    return formatter.format(value);
  }

  static String formatDecimal(double value, {int decimals = 2}) {
    return value.toStringAsFixed(decimals);
  }
}
