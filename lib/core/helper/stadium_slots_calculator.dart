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
  }) {
    final day = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);

    if (!stadium.isWorkingDay(day)) {
      return const StadiumSlotResult(
        normal: SlotGroup([]),
        extra: SlotGroup([]),
      );
    }

    if (!stadium.isValidTimeConfig) {
      return const StadiumSlotResult(
        normal: SlotGroup([]),
        extra: SlotGroup([]),
      );
    }

    final step = stadium.slotStepMinutes;

    final normalRanges = _buildNormalRanges(stadium, day);
    final extraRanges = _buildExtraRangesForSelectedDay(stadium, day);

    final normal = _buildSlotsFromRanges(
      ranges: normalRanges,
      stepMinutes: step,
      durationMinutes: durationMinutes,
      bookings: bookings,
      locale: timeLabelLocale,
    );

    final extra = _buildSlotsFromRanges(
      ranges: extraRanges,
      stepMinutes: step,
      durationMinutes: durationMinutes,
      bookings: bookings,
      locale: timeLabelLocale,
    );

    return StadiumSlotResult(
      normal: SlotGroup(normal),
      extra: SlotGroup(extra),
    );
  }

  static List<_Range> _buildNormalRanges(StadiumModel stadium, DateTime day) {
    if (!stadium.hasNormalShift || !stadium.isValidNormalShift) return [];

    final openM = stadium.openMinutes!;
    final closeM = stadium.closeMinutes!;

    final start = day.add(Duration(minutes: openM));

    // Normal ينتهي عند 12:00 (نهاية اليوم) كحد أقصى
    final normalizedClose = closeM > 1440 ? 1440 : closeM;
    final end = day.add(Duration(minutes: normalizedClose));

    if (!start.isBefore(end)) return [];

    return [_Range(start, end)];
  }

  static List<_Range> _buildExtraRangesForSelectedDay(
    StadiumModel stadium,
    DateTime day,
  ) {
    if (!stadium.hasExtraShift || !stadium.isValidExtraShift) return [];

    final extraCloseM = stadium.extraCloseMinutes!;
    if (extraCloseM <= 0) return [];

    // ✅ Extra في نفس اليوم المختار: من 00:00 إلى extraCloseMinutes
    final start = day; // 00:00
    final normalizedClose = extraCloseM > 1440 ? 1440 : extraCloseM;
    final end = day.add(Duration(minutes: normalizedClose));

    if (!start.isBefore(end)) return [];

    return [_Range(start, end)];
  }

  static List<SlotUiItem> _buildSlotsFromRanges({
    required List<_Range> ranges,
    required int stepMinutes,
    required int durationMinutes,
    required List<BookingModel> bookings,
    required String locale,
  }) {
    if (durationMinutes <= 0) return [];

    final out = <SlotUiItem>[];

    for (final r in ranges) {
      var cursor = r.start;

      while (true) {
        final end = cursor.add(Duration(minutes: durationMinutes));
        if (end.isAfter(r.end)) break;

        final isBusy = bookings.any((b) => b.overlaps(cursor, end));

        out.add(
          SlotUiItem(
            label: StadiumTimeFormatHelper.formatSlotLabel(cursor, locale: locale),
            start: cursor,
            end: end,
            isDisabled: isBusy,
          ),
        );

        cursor = cursor.add(Duration(minutes: stepMinutes));
        if (cursor.isAfter(r.end)) break;
      }
    }

    out.sort((a, b) => a.start.compareTo(b.start));
    return out;
  }
}

class _Range {
  final DateTime start;
  final DateTime end;

  const _Range(this.start, this.end);
}
