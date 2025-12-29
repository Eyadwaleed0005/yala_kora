import 'package:yalakora/core/models/booking_model.dart';

class FakeBookingsData {
  const FakeBookingsData._();

  static DateTime _d(DateTime x) => DateTime(x.year, x.month, x.day);

  static DateTime _thisWeekMonday(DateTime now) {
    final today = _d(now);
    return today.subtract(Duration(days: today.weekday - DateTime.monday));
  }

  static DateTime _thisWeekSunday(DateTime now) =>
      _thisWeekMonday(now).subtract(const Duration(days: 1));

  static DateTime _dayPlus(DateTime day, int addDays) =>
      _d(day).add(Duration(days: addDays));

  static bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  static List<BookingModel> bookingsForDay({
    required String stadiumId,
    required DateTime selectedDay,
  }) {
    final day = _d(selectedDay);

    final baseMon = _thisWeekMonday(DateTime.now());
    final baseSun = _thisWeekSunday(DateTime.now());

    final sun = baseSun;
    final mon = baseMon;
    final tue = _dayPlus(baseMon, 1);

    if (stadiumId == "st_004") {
      if (_isSameDay(day, sun)) {
        return [
          BookingModel(
            id: "st004_sun_1",
            stadiumId: stadiumId,
            userId: "u_sun_1",
            durationMinutes: 60,
            start: DateTime(sun.year, sun.month, sun.day, 23, 0),
            end: DateTime(sun.year, sun.month, sun.day + 1, 0, 0),
          ),
        ];
      }

      if (_isSameDay(day, mon)) {
        return [
          BookingModel(
            id: "st004_mon_extra_1",
            stadiumId: stadiumId,
            userId: "u_mon_e1",
            durationMinutes: 90,
            start: DateTime(mon.year, mon.month, mon.day, 0, 0),
            end: DateTime(mon.year, mon.month, mon.day, 1, 30),
          ),
          BookingModel(
            id: "st004_mon_extra_2",
            stadiumId: stadiumId,
            userId: "u_mon_e2",
            durationMinutes: 60,
            start: DateTime(mon.year, mon.month, mon.day, 2, 0),
            end: DateTime(mon.year, mon.month, mon.day, 3, 0),
          ),
          BookingModel(
            id: "st004_mon_main_1",
            stadiumId: stadiumId,
            userId: "u_mon_m1",
            durationMinutes: 60,
            start: DateTime(mon.year, mon.month, mon.day, 10, 0),
            end: DateTime(mon.year, mon.month, mon.day, 11, 0),
          ),
          BookingModel(
            id: "st004_mon_main_2",
            stadiumId: stadiumId,
            userId: "u_mon_m2",
            durationMinutes: 90,
            start: DateTime(mon.year, mon.month, mon.day, 21, 30),
            end: DateTime(mon.year, mon.month, mon.day, 23, 0),
          ),
        ];
      }

      if (_isSameDay(day, tue)) {
        return [
          BookingModel(
            id: "st004_tue_extra_1",
            stadiumId: stadiumId,
            userId: "u_tue_e1",
            durationMinutes: 60,
            start: DateTime(tue.year, tue.month, tue.day, 1, 0),
            end: DateTime(tue.year, tue.month, tue.day, 2, 0),
          ),
          BookingModel(
            id: "st004_tue_main_1",
            stadiumId: stadiumId,
            userId: "u_tue_m1",
            durationMinutes: 120,
            start: DateTime(tue.year, tue.month, tue.day, 18, 0),
            end: DateTime(tue.year, tue.month, tue.day, 20, 0),
          ),
        ];
      }
    }

    return [];
  }
}
