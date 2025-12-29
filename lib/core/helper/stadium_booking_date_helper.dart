import 'package:intl/intl.dart';

class StadiumDateItem {
  final DateTime date;
  final String dayName;
  final String dayNumber;
  final String monthName;
  final bool isOpen;

  const StadiumDateItem({
    required this.date,
    required this.dayName,
    required this.dayNumber,
    required this.monthName,
    required this.isOpen,
  });
}

class StadiumBookingDateHelper {
  StadiumBookingDateHelper._();

  static List<StadiumDateItem> buildDateStrip({
    required List<int>? workingDays,
    int count = 8,
    String locale = 'ar',
    DateTime? fromDate, 
  }) {
    final now = fromDate ?? DateTime.now();
    final start = DateTime(now.year, now.month, now.day);

    final days = workingDays ?? const <int>[];

    final dayFormatter = DateFormat('EEEE', locale);
    final dayNumFormatter = DateFormat('d', locale);
    final monthFormatter = DateFormat('MMMM', locale);

    return List.generate(count, (i) {
      final date = start.add(Duration(days: i));
      final isOpen = days.isEmpty ? true : days.contains(date.weekday);

      return StadiumDateItem(
        date: date,
        dayName: dayFormatter.format(date),
        dayNumber: dayNumFormatter.format(date),
        monthName: monthFormatter.format(date),
        isOpen: isOpen,
      );
    });
  }
}

