import 'package:intl/intl.dart';

class DateHelper {
  static DateTime getFirstDayOfMonth(DateTime monthAndYear) {
    return DateTime(monthAndYear.year, monthAndYear.month, 1);
  }

  static DateTime getLastDayOfMonth(DateTime monthAndYear) {
    return monthAndYear.month < 12
        ? DateTime(monthAndYear.year, monthAndYear.month + 1, 0)
        : DateTime(monthAndYear.year + 1, 1, 0);
  }

  static String getMonthName(DateTime monthAndYear) {
    final monthDateFormatter = DateFormat('MMMM');
    return monthDateFormatter.format(monthAndYear);
  }
}
