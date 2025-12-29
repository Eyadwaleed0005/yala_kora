class StadiumModel {
  const StadiumModel({
    this.id,
    required this.name,
    required this.governorate,
    required this.city,
    required this.coverImage,
    required this.rating,
    this.description,
    this.ownerName,
    this.images,
    this.address,
    this.lat,
    this.lng,
    this.pricePerHour,
    this.workingDays,
    this.openMinutes,
    this.closeMinutes,
    this.extraOpenMinutes,
    this.extraCloseMinutes,
    this.slotStepMinutes = 30,
  });

  final String? id;

  final String name;
  final String governorate;
  final String city;

  final String coverImage;
  final double rating;

  final String? description;
  final String? ownerName;

  final List<String>? images;
  final String? address;

  final double? lat;
  final double? lng;

  final num? pricePerHour;

  /// 1=Mon..7=Sun (DateTime.weekday)
  final List<int>? workingDays;

  /// 0..1440 (24:00 = 1440)
  final int? openMinutes;
  final int? closeMinutes;

  /// 0..1440 (24:00 = 1440)
  final int? extraOpenMinutes;
  final int? extraCloseMinutes;

  /// خطوة توليد الـ slots
  final int slotStepMinutes;

  // ================== Getters ==================

  String get location => '$governorate – $city';

  bool get hasExtraShift =>
      extraOpenMinutes != null && extraCloseMinutes != null;

  bool get hasNormalShift =>
      openMinutes != null && closeMinutes != null;

  /// هل الشيفت بيعدّي بعد نص الليل؟
  bool get normalCrossMidnight =>
      hasNormalShift && closeMinutes! < openMinutes!;

  bool get extraCrossMidnight =>
      hasExtraShift && extraCloseMinutes! < extraOpenMinutes!;

  // ================== Validation ==================

  bool _validMinutes(int? m) => m != null && m >= 0 && m <= 1440;

  bool get isValidStep =>
      slotStepMinutes > 0 && slotStepMinutes <= 240;

  bool get isValidNormalShift {
    if (!hasNormalShift) return true;
    return _validMinutes(openMinutes) &&
        _validMinutes(closeMinutes) &&
        openMinutes != closeMinutes;
  }

  bool get isValidExtraShift {
    if (!hasExtraShift) return true;
    return _validMinutes(extraOpenMinutes) &&
        _validMinutes(extraCloseMinutes) &&
        extraOpenMinutes != extraCloseMinutes;
  }

  /// استخدم دي قبل أي حساب وقت
  bool get isValidTimeConfig =>
      isValidStep && isValidNormalShift && isValidExtraShift;

  // ================== Logic ==================

  bool isWorkingDay(DateTime day) {
    if (workingDays == null || workingDays!.isEmpty) return true;
    return workingDays!.contains(day.weekday);
  }

  // ================== Utils ==================

  static int parseHmToMinutes(String hhmm) {
    final parts = hhmm.trim().split(':');
    if (parts.length != 2) {
      throw FormatException('Invalid time format: $hhmm');
    }

    final h = int.parse(parts[0]);
    final m = int.parse(parts[1]);

    if (h == 24 && m == 0) return 1440;
    if (h < 0 || h > 23) {
      throw FormatException('Invalid hour: $hhmm');
    }
    if (m < 0 || m > 59) {
      throw FormatException('Invalid minutes: $hhmm');
    }
    return (h * 60) + m;
  }

  // ================== Copy ==================

  StadiumModel copyWith({
    String? id,
    String? name,
    String? governorate,
    String? city,
    String? coverImage,
    double? rating,
    String? description,
    String? ownerName,
    List<String>? images,
    String? address,
    double? lat,
    double? lng,
    num? pricePerHour,
    List<int>? workingDays,
    int? openMinutes,
    int? closeMinutes,
    int? extraOpenMinutes,
    int? extraCloseMinutes,
    int? slotStepMinutes,
  }) {
    return StadiumModel(
      id: id ?? this.id,
      name: name ?? this.name,
      governorate: governorate ?? this.governorate,
      city: city ?? this.city,
      coverImage: coverImage ?? this.coverImage,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      ownerName: ownerName ?? this.ownerName,
      images: images ?? this.images,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      pricePerHour: pricePerHour ?? this.pricePerHour,
      workingDays: workingDays ?? this.workingDays,
      openMinutes: openMinutes ?? this.openMinutes,
      closeMinutes: closeMinutes ?? this.closeMinutes,
      extraOpenMinutes: extraOpenMinutes ?? this.extraOpenMinutes,
      extraCloseMinutes: extraCloseMinutes ?? this.extraCloseMinutes,
      slotStepMinutes: slotStepMinutes ?? this.slotStepMinutes,
    );
  }
}
