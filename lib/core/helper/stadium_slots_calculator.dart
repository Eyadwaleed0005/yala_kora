import 'package:yalakora/core/helper/stadium_time_format_helper.dart';
import 'package:yalakora/core/models/booking_model.dart';
import 'package:yalakora/core/models/stadium_model.dart';

class StadiumSlotResult {
  final SlotGroup normal;
  final SlotGroup extra;

  const StadiumSlotResult({
    required this.normal,
    required this.extra,
  });
}

class SlotGroup {
  final List<SlotUiItem> items;

  const SlotGroup(this.items);
}

class SlotUiItem {
  final String label;
  final DateTime start;
  final DateTime end;
  final bool isDisabled;

  const SlotUiItem({
    required this.label,
    required this.start,
    required this.end,
    required this.isDisabled,
  });
}

class StadiumSlotsCalculator {
  StadiumSlotsCalculator._();

  static StadiumSlotResult buildForDay({
    required StadiumModel stadium,
    required DateTime selectedDay,
    required List<BookingModel> bookings,
    required int durationMinutes,
    String timeLabelLocale = 'ar',
    DateTime? nowOverride,
    int minLeadMinutes = 5,
  }) {
    final day = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);

    if (!stadium.isWorkingDay(day) || !stadium.isValidTimeConfig) {
      return const StadiumSlotResult(
        normal: SlotGroup([]),
        extra: SlotGroup([]),
      );
    }

    final step = stadium.slotStepMinutes;

    final normalRanges = _buildNormalRanges(stadium, day);
    final extraRanges = _buildExtraRangesForSelectedDay(stadium, day);

    final now = nowOverride ?? DateTime.now();

    return StadiumSlotResult(
      normal: SlotGroup(
        _buildSlotsFromRanges(
          ranges: normalRanges,
          stepMinutes: step,
          durationMinutes: durationMinutes,
          bookings: bookings,
          locale: timeLabelLocale,
          selectedDay: day,
          now: now,
          minLeadMinutes: minLeadMinutes,
        ),
      ),
      extra: SlotGroup(
        _buildSlotsFromRanges(
          ranges: extraRanges,
          stepMinutes: step,
          durationMinutes: durationMinutes,
          bookings: bookings,
          locale: timeLabelLocale,
          selectedDay: day,
          now: now,
          minLeadMinutes: minLeadMinutes,
        ),
      ),
    );
  }

  static List<_Range> _buildNormalRanges(StadiumModel stadium, DateTime day) {
    if (!stadium.hasNormalShift || !stadium.isValidNormalShift) return [];

    final start = day.add(Duration(minutes: stadium.openMinutes!));
    final end = day.add(
      Duration(minutes: stadium.closeMinutes!.clamp(0, 1440)),
    );

    if (!start.isBefore(end)) return [];
    return [_Range(start, end)];
  }

  static List<_Range> _buildExtraRangesForSelectedDay(
    StadiumModel stadium,
    DateTime day,
  ) {
    if (!stadium.hasExtraShift || !stadium.isValidExtraShift) return [];

    final end = day.add(
      Duration(minutes: stadium.extraCloseMinutes!.clamp(0, 1440)),
    );

    if (!day.isBefore(end)) return [];
    return [_Range(day, end)];
  }

  static List<SlotUiItem> _buildSlotsFromRanges({
    required List<_Range> ranges,
    required int stepMinutes,
    required int durationMinutes,
    required List<BookingModel> bookings,
    required String locale,
    required DateTime selectedDay,
    required DateTime now,
    required int minLeadMinutes,
  }) {
    if (durationMinutes <= 0) return [];

    final isToday = _isSameDay(selectedDay, now);
    final nowWithLead = now.add(Duration(minutes: minLeadMinutes));
    final out = <SlotUiItem>[];

    for (final r in ranges) {
      var cursor = r.start;

      while (true) {
        final end = cursor.add(Duration(minutes: durationMinutes));
        if (end.isAfter(r.end)) break;

        final passed = isToday && cursor.isBefore(now);
        final tooSoon = isToday && !passed && cursor.isBefore(nowWithLead);
        final busy = bookings.any((b) => b.overlaps(cursor, end));

        out.add(
          SlotUiItem(
            label: StadiumTimeFormatHelper.formatSlotLabel(
              cursor,
              locale: locale,
            ),
            start: cursor,
            end: end,
            isDisabled: passed || tooSoon || busy,
          ),
        );

        cursor = cursor.add(Duration(minutes: stepMinutes));
        if (cursor.isAfter(r.end)) break;
      }
    }

    out.sort((a, b) => a.start.compareTo(b.start));
    return out;
  }

  static bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

class _Range {
  final DateTime start;
  final DateTime end;

  const _Range(this.start, this.end);
}
