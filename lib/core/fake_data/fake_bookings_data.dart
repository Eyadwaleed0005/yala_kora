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
    final wed = _dayPlus(baseMon, 2);
    final thu = _dayPlus(baseMon, 3);
    final fri = _dayPlus(baseMon, 4);
    final sat = _dayPlus(baseMon, 5);

    if (stadiumId == "st_004") {
      if (_isSameDay(day, sun)) {
        return [
          BookingModel(
            id: "st004_sun_2330",
            stadiumId: stadiumId,
            userId: "u_sun_1",
            durationMinutes: 60,
            start: DateTime(sun.year, sun.month, sun.day, 23, 30),
            end: DateTime(sun.year, sun.month, sun.day + 1, 0, 30),
          ),
        ];
      }

      if (_isSameDay(day, mon)) {
        return [
          BookingModel(
            id: "st004_mon_extra_0000",
            stadiumId: stadiumId,
            userId: "u_mon_e1",
            durationMinutes: 90,
            start: DateTime(mon.year, mon.month, mon.day, 0, 0),
            end: DateTime(mon.year, mon.month, mon.day, 1, 30),
          ),
          BookingModel(
            id: "st004_mon_extra_0200",
            stadiumId: stadiumId,
            userId: "u_mon_e2",
            durationMinutes: 60,
            start: DateTime(mon.year, mon.month, mon.day, 2, 0),
            end: DateTime(mon.year, mon.month, mon.day, 3, 0),
          ),
          BookingModel(
            id: "st004_mon_main_1000",
            stadiumId: stadiumId,
            userId: "u_mon_m1",
            durationMinutes: 60,
            start: DateTime(mon.year, mon.month, mon.day, 10, 0),
            end: DateTime(mon.year, mon.month, mon.day, 11, 0),
          ),
          BookingModel(
            id: "st004_mon_main_2130",
            stadiumId: stadiumId,
            userId: "u_mon_m2",
            durationMinutes: 90,
            start: DateTime(mon.year, mon.month, mon.day, 21, 30),
            end: DateTime(mon.year, mon.month, mon.day, 23, 0),
          ),
          BookingModel(
            id: "st004_mon_main_2330",
            stadiumId: stadiumId,
            userId: "u_mon_m3",
            durationMinutes: 60,
            start: DateTime(mon.year, mon.month, mon.day, 23, 30),
            end: DateTime(mon.year, mon.month, mon.day + 1, 0, 30),
          ),
        ];
      }

      if (_isSameDay(day, tue)) {
        return [
          BookingModel(
            id: "st004_tue_extra_0030",
            stadiumId: stadiumId,
            userId: "u_tue_e1",
            durationMinutes: 60,
            start: DateTime(tue.year, tue.month, tue.day, 0, 30),
            end: DateTime(tue.year, tue.month, tue.day, 1, 30),
          ),
          BookingModel(
            id: "st004_tue_main_1800",
            stadiumId: stadiumId,
            userId: "u_tue_m1",
            durationMinutes: 120,
            start: DateTime(tue.year, tue.month, tue.day, 18, 0),
            end: DateTime(tue.year, tue.month, tue.day, 20, 0),
          ),
        ];
      }
    }

    if (stadiumId == "st_001") {
      if (_isSameDay(day, mon)) {
        return [
          BookingModel(
            id: "st001_mon_1700",
            stadiumId: stadiumId,
            userId: "u1",
            durationMinutes: 90,
            start: DateTime(mon.year, mon.month, mon.day, 17, 0),
            end: DateTime(mon.year, mon.month, mon.day, 18, 30),
          ),
          BookingModel(
            id: "st001_mon_2000",
            stadiumId: stadiumId,
            userId: "u2",
            durationMinutes: 60,
            start: DateTime(mon.year, mon.month, mon.day, 20, 0),
            end: DateTime(mon.year, mon.month, mon.day, 21, 0),
          ),
        ];
      }
    }

    if (stadiumId == "st_008") {
      if (_isSameDay(day, thu)) {
        return [
          BookingModel(
            id: "st008_thu_2300",
            stadiumId: stadiumId,
            userId: "u1",
            durationMinutes: 60,
            start: DateTime(thu.year, thu.month, thu.day, 23, 0),
            end: DateTime(thu.year, thu.month, thu.day + 1, 0, 0),
          ),
          BookingModel(
            id: "st008_thu_extra_0015",
            stadiumId: stadiumId,
            userId: "u2",
            durationMinutes: 45,
            start: DateTime(thu.year, thu.month, thu.day + 1, 0, 15),
            end: DateTime(thu.year, thu.month, thu.day + 1, 1, 0),
          ),
        ];
      }
    }

    if (stadiumId == "st_020") {
      if (_isSameDay(day, wed)) {
        return [
          BookingModel(
            id: "st020_wed_main_0900",
            stadiumId: stadiumId,
            userId: "u1",
            durationMinutes: 60,
            start: DateTime(wed.year, wed.month, wed.day, 9, 0),
            end: DateTime(wed.year, wed.month, wed.day, 10, 0),
          ),
          BookingModel(
            id: "st020_wed_main_1030",
            stadiumId: stadiumId,
            userId: "u2",
            durationMinutes: 60,
            start: DateTime(wed.year, wed.month, wed.day, 10, 30),
            end: DateTime(wed.year, wed.month, wed.day, 11, 30),
          ),
          BookingModel(
            id: "st020_wed_main_2330",
            stadiumId: stadiumId,
            userId: "u3",
            durationMinutes: 60,
            start: DateTime(wed.year, wed.month, wed.day, 23, 30),
            end: DateTime(wed.year, wed.month, wed.day + 1, 0, 30),
          ),
          BookingModel(
            id: "st020_wed_extra_0000",
            stadiumId: stadiumId,
            userId: "u4",
            durationMinutes: 90,
            start: DateTime(wed.year, wed.month, wed.day + 1, 0, 0),
            end: DateTime(wed.year, wed.month, wed.day + 1, 1, 30),
          ),
          BookingModel(
            id: "st020_wed_extra_0200",
            stadiumId: stadiumId,
            userId: "u5",
            durationMinutes: 60,
            start: DateTime(wed.year, wed.month, wed.day + 1, 2, 0),
            end: DateTime(wed.year, wed.month, wed.day + 1, 3, 0),
          ),
        ];
      }
    }

    if (stadiumId == "st_011") {
      if (_isSameDay(day, fri)) {
        return [
          BookingModel(
            id: "st011_fri_1200",
            stadiumId: stadiumId,
            userId: "u1",
            durationMinutes: 60,
            start: DateTime(fri.year, fri.month, fri.day, 12, 0),
            end: DateTime(fri.year, fri.month, fri.day, 13, 0),
          ),
          BookingModel(
            id: "st011_fri_1600",
            stadiumId: stadiumId,
            userId: "u2",
            durationMinutes: 120,
            start: DateTime(fri.year, fri.month, fri.day, 16, 0),
            end: DateTime(fri.year, fri.month, fri.day, 18, 0),
          ),
        ];
      }

      if (_isSameDay(day, sat)) {
        return [
          BookingModel(
            id: "st011_sat_1000",
            stadiumId: stadiumId,
            userId: "u3",
            durationMinutes: 90,
            start: DateTime(sat.year, sat.month, sat.day, 10, 0),
            end: DateTime(sat.year, sat.month, sat.day, 11, 30),
          ),
        ];
      }
    }

    if (stadiumId == "st_012") {
      if (_isSameDay(day, mon)) {
        return [
          BookingModel(
            id: "st012_mon_0030",
            stadiumId: stadiumId,
            userId: "u1",
            durationMinutes: 60,
            start: DateTime(mon.year, mon.month, mon.day, 0, 30),
            end: DateTime(mon.year, mon.month, mon.day, 1, 30),
          ),
          BookingModel(
            id: "st012_mon_0200",
            stadiumId: stadiumId,
            userId: "u2",
            durationMinutes: 120,
            start: DateTime(mon.year, mon.month, mon.day, 2, 0),
            end: DateTime(mon.year, mon.month, mon.day, 4, 0),
          ),
        ];
      }
    }

    if (stadiumId == "st_013") {
      if (_isSameDay(day, tue)) {
        return [
          BookingModel(
            id: "st013_tue_0800",
            stadiumId: stadiumId,
            userId: "u1",
            durationMinutes: 60,
            start: DateTime(tue.year, tue.month, tue.day, 8, 0),
            end: DateTime(tue.year, tue.month, tue.day, 9, 0),
          ),
          BookingModel(
            id: "st013_tue_0930",
            stadiumId: stadiumId,
            userId: "u2",
            durationMinutes: 90,
            start: DateTime(tue.year, tue.month, tue.day, 9, 30),
            end: DateTime(tue.year, tue.month, tue.day, 11, 0),
          ),
        ];
      }
    }

    if (stadiumId == "st_014") {
      if (_isSameDay(day, thu)) {
        return [
          BookingModel(
            id: "st014_thu_1700",
            stadiumId: stadiumId,
            userId: "u1",
            durationMinutes: 45,
            start: DateTime(thu.year, thu.month, thu.day, 17, 0),
            end: DateTime(thu.year, thu.month, thu.day, 17, 45),
          ),
          BookingModel(
            id: "st014_thu_1815",
            stadiumId: stadiumId,
            userId: "u2",
            durationMinutes: 30,
            start: DateTime(thu.year, thu.month, thu.day, 18, 15),
            end: DateTime(thu.year, thu.month, thu.day, 18, 45),
          ),
        ];
      }
    }

    return [];
  }
}
