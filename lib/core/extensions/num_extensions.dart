import '../utils/number_formatter.dart';

extension NumExtensions on num {
  String toCurrency({String? currency}) {
    return NumberFormatter.formatCurrency(toDouble(), currency: currency);
  }

  String toCompactCurrency({String? currency}) {
    return NumberFormatter.formatCompactCurrency(
      toDouble(),
      currency: currency,
    );
  }

  String toPercentage({int decimals = 1}) {
    return NumberFormatter.formatPercentage(toDouble(), decimals: decimals);
  }

  double roundToTwoDecimals() {
    return NumberFormatter.roundToTwoDecimals(toDouble());
  }

  bool isWithinTolerance(num other, double tolerance) {
    final difference = (this - other).abs();
    return difference <= tolerance;
  }

  bool isApproximately(num other, {double percentage = 0.05}) {
    if (this == 0 && other == 0) return true;
    if (this == 0 || other == 0) return false;

    final tolerance = this * percentage;
    return isWithinTolerance(other, tolerance.abs());
  }
}

extension DoubleExtensions on double {
  String toFormattedAmount() {
    return NumberFormatter.formatAmount(this);
  }

  String toFormattedDecimal({int decimals = 2}) {
    return NumberFormatter.formatDecimal(this, decimals: decimals);
  }
}

extension IntExtensions on int {
  String toFormattedInteger() {
    return NumberFormatter.formatInteger(this);
  }
}
