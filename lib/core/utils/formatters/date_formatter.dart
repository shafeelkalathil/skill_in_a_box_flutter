import 'package:intl/intl.dart';

class DateFormatter {
  static String formatISOToCustomDate(String? isoDateString) {
    if (isoDateString == null || isoDateString.isEmpty) {
      return '--';
    }

    try {
      final dateTime = DateTime.parse(isoDateString);

      final day = dateTime.day.toString().padLeft(2, '0');
      final month = dateTime.month.toString().padLeft(2, '0');
      final year = dateTime.year.toString();

      return '$day-$month-$year';
    } catch (e) {
      return '--';
    }
  }

  static DateTime? parseDate(String date) {
    try {
      return DateFormat('dd-MM-yyyy').parse(date);
    } catch (e) {
      return null;
    }
  }

  static String getFormattedDate(
    DateTime? date, {
    String format = 'dd-MM-yyyy',
  }) {
    if (date == null) {
      return '';
    } else {
      return DateFormat(format).format(date);
    }
  }
}
