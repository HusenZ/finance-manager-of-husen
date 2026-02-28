import 'package:intl/intl.dart';
import '../constants/app_constants.dart';

class DateFormatter {
  DateFormatter._();

  static String formatDate(DateTime date) {
    return DateFormat(AppConstants.dateFormat).format(date);
  }

  static String formatTime(DateTime date) {
    return DateFormat(AppConstants.timeFormat).format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat(AppConstants.dateTimeFormat).format(date);
  }

  static String formatMonthYear(DateTime date) {
    return DateFormat(AppConstants.monthYearFormat).format(date);
  }

  static String formatMonth(DateTime date) {
    return DateFormat(AppConstants.monthFormat).format(date);
  }

  static String getRelativeDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == today) {
      return 'Today';
    } else if (dateToCheck == yesterday) {
      return 'Yesterday';
    } else if (dateToCheck.isAfter(today.subtract(const Duration(days: 7)))) {
      return DateFormat('EEEE').format(date);
    } else if (dateToCheck.year == now.year) {
      return DateFormat('MMM d').format(date);
    } else {
      return formatDate(date);
    }
  }

  static String getMonthYearKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}';
  }

  static DateTime getStartOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  static DateTime getEndOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0, 23, 59, 59);
  }

  static DateTime getStartOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static DateTime getEndOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  static int getDaysBetween(DateTime start, DateTime end) {
    final startDate = getStartOfDay(start);
    final endDate = getStartOfDay(end);
    return endDate.difference(startDate).inDays;
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static bool isSameMonth(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month;
  }

  static DateTime? parseDate(String dateString) {
    try {
      return DateFormat(AppConstants.dateFormat).parse(dateString);
    } catch (e) {
      return null;
    }
  }

  static List<DateTime> getMonthsInRange(
    DateTime start,
    DateTime end,
    int count,
  ) {
    final months = <DateTime>[];
    var current = DateTime(end.year, end.month, 1);

    for (var i = 0; i < count; i++) {
      if (current.isBefore(start)) break;
      months.add(current);
      current = DateTime(current.year, current.month - 1, 1);
    }

    return months.reversed.toList();
  }
}
