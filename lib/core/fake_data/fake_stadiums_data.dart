import 'package:yalakora/core/models/stadium_model.dart';

class FakeStadiumsData {
  const FakeStadiumsData._();

  static const List<StadiumModel> stadiums = [
    StadiumModel(
      id: "st_004",
      name: "ملعب إيجل أرينا",
      governorate: "القاهرة",
      city: "التجمع",
      rating: 4.6,
      pricePerHour: 55,
      openMinutes: 540, // 09:00
      closeMinutes: 1440, // 24:00 (نهاية اليوم)
      extraOpenMinutes: 0, // 00:00
      extraCloseMinutes: 180, // 03:00
      slotStepMinutes: 30,
      workingDays: [1, 2, 3, 4, 5, 6, 7],
      description: "ملعب حديث بمرافق كاملة",
      ownerName: "عمر سعيد",
      address: "التجمع الخامس",
      coverImage:
          "https://images.unsplash.com/photo-1508098682722-e99c43a406b2?q=80&w=800",
      lat: 30.015,
      lng: 31.481,
      images: [
        "https://images.unsplash.com/photo-1521412644187-c49fa049e84d?q=80&w=800",
        "https://images.unsplash.com/photo-1483721310020-03333e577078?q=80&w=800",
      ],
    ),

    StadiumModel(
      id: "st_001",
      name: "ملعب الابطال الرياضى",
      governorate: "القاهرة",
      city: "مدينة نصر",
      rating: 4.7,
      pricePerHour: 50,
      openMinutes: 840, // 14:00
      closeMinutes: 1380, // 23:00
      workingDays: [1, 2, 3, 4, 5, 6],
      description: "ملعب نجيل صناعي مجهز بإضاءة ليلية",
      ownerName: "أحمد علي",
      address: "شارع عباس العقاد جنب كارفور",
      coverImage:
          "https://images.unsplash.com/photo-1483721310020-03333e577078?q=80&w=800",
      images: [
        "https://images.unsplash.com/photo-1518091043644-c1d4457512c6?q=80&w=800",
        "https://images.unsplash.com/photo-1521412644187-c49fa049e84d?q=80&w=800",
      ],
      lat: 30.061,
      lng: 31.338,
    ),

    StadiumModel(
      id: "st_008",
      name: "ملعب دسوق الدولي",
      governorate: "كفر الشيخ",
      city: "دسوق",
      rating: 4.8,
      pricePerHour: 55,
      openMinutes: 960, // 16:00
      closeMinutes: 1440, // 24:00
      extraOpenMinutes: 0, // 00:00
      extraCloseMinutes: 60, // 01:00
      workingDays: [1, 2, 3, 4, 5, 6, 7],
      description: "ملعب ممتاز لإقامة البطولات والدورات",
      ownerName: "حسن عبدالتواب",
      address: "شارع البحر – دسوق",
      coverImage:
          "https://images.unsplash.com/photo-1518091043644-c1d4457512c6?q=80&w=800",
      lat: 31.133,
      lng: 30.644,
    ),
  ];

  static StadiumModel? getById(String id) {
    for (final s in stadiums) {
      if (s.id == id) return s;
    }
    return null;
  }
}
