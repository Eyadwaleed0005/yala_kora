import 'package:intl/intl.dart';

/// عنصر واحد في شريط التواريخ (اليوم + التاريخ + الشهر + متاح/إجازة)
class StadiumDateItem {
  final DateTime date;
  final String dayName;   // الأحد
  final String dayNumber; // 2
  final String monthName; // أبريل
  final bool isOpen;      // true متاح - false إجازة

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

  /// يبني شريط تواريخ متتالي من تاريخ الموبايل.
  /// - count: عدد الكروت اللي هتعرضها (مثلاً 8)
  /// - workingDays: أيام عمل الملعب (1=Mon..7=Sun) زي DateTime.weekday
  static List<StadiumDateItem> buildDateStrip({
    required List<int>? workingDays,
    int count = 8,
    String locale = 'ar',
    DateTime? fromDate,
  }) {
    final now = fromDate ?? DateTime.now();
    final start = DateTime(now.year, now.month, now.day);

    final days = workingDays ?? const <int>[];

    final dayFormatter = DateFormat('EEEE', locale); // الأحد
    final dayNumFormatter = DateFormat('d', locale); // 2
    final monthFormatter = DateFormat('MMMM', locale); // أبريل

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

  /// هل تاريخ معيّن متاح للحجز حسب workingDays؟
  static bool isDateOpen(DateTime date, List<int>? workingDays) {
    final days = workingDays ?? const <int>[];
    return days.isEmpty ? true : days.contains(date.weekday);
  }
}
