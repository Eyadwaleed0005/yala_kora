class BookingModel {
  const BookingModel({
    required this.id,
    required this.stadiumId,
    required this.start,
    required this.end,
    required this.durationMinutes,
    required this.userId,
  });

  final String id;
  final String stadiumId;
  final DateTime start;
  final DateTime end;
  final int durationMinutes;
  final String userId;

  DateTime get day => DateTime(start.year, start.month, start.day);

  bool overlaps(DateTime rangeStart, DateTime rangeEnd) {
    return rangeStart.isBefore(end) && rangeEnd.isAfter(start);
  }

  BookingModel copyWith({
    String? id,
    String? stadiumId,
    DateTime? start,
    DateTime? end,
    int? durationMinutes,
    String? userId,
  }) {
    return BookingModel(
      id: id ?? this.id,
      stadiumId: stadiumId ?? this.stadiumId,
      start: start ?? this.start,
      end: end ?? this.end,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      userId: userId ?? this.userId,
    );
  }
}
