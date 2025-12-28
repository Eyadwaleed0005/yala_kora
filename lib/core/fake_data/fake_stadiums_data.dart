import 'package:yalakora/core/models/stadium_model.dart';

class FakeStadiumsData {
  const FakeStadiumsData._();

  static const List<StadiumModel> stadiums = [
    StadiumModel(
      id: "st_001",
      name: "ملعب  الابطال الرياضى",
      governorate: "القاهرة",
      city: "مدينة نصر",
      rating: 4.7,
      pricePerHour: 50,
      openTime: "14:00",
      closeTime: "23:00",
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
      id: "st_002",
      name: "ملعب بلازا",
      governorate: "الجيزة",
      city: "الدقي",
      rating: 4.5,
      pricePerHour: 45,
      openTime: "12:00",
      closeTime: "22:00",
      workingDays: [1, 2, 3, 4, 5],
      description: "ملعب خمس نجوم مناسب للبطولات الصغيرة",
      ownerName: "محمد حسن",
      address: "شارع التحرير",
      coverImage:
          "https://images.unsplash.com/photo-1521412644187-c49fa049e84d?q=80&w=800",
      lat: 30.038,
      lng: 31.215,
    ),

    StadiumModel(
      id: "st_003",
      name: "ملعب سكاي سبورت",
      governorate: "الإسكندرية",
      city: "سموحة",
      rating: 4.9,
      pricePerHour: 60,
      openTime: "15:00",
      closeTime: "00:00",
      workingDays: [1, 2, 3, 4, 5, 6, 7],
      description: "ملعب مميز بإطلالة مفتوحة",
      ownerName: "كريم فؤاد",
      address: "شارع فوزي معاذ",
      coverImage:
          "https://images.unsplash.com/photo-1518091043644-c1d4457512c6?q=80&w=800",
      lat: 31.215,
      lng: 29.955,
    ),

    StadiumModel(
      id: "st_004",
      name: "ملعب إيجل أرينا",
      governorate: "القاهرة",
      city: "التجمع",
      rating: 4.6,
      pricePerHour: 55,
      openTime: "16:00",
      closeTime: "01:00",
      workingDays: [3, 4, 5, 6, 7],
      description: "ملعب حديث بمرافق كاملة",
      ownerName: "عمر سعيد",
      address: "التجمع الخامس",
      coverImage:
          "https://images.unsplash.com/photo-1508098682722-e99c43a406b2?q=80&w=800",
      lat: 30.015,
      lng: 31.481,
    ),

    StadiumModel(
      id: "st_005",
      name: "ملعب فايف ستار",
      governorate: "القاهرة",
      city: "المعادي",
      rating: 4.3,
      pricePerHour: 40,
      openTime: "13:00",
      closeTime: "21:00",
      workingDays: [1, 2, 3, 4, 5],
      description: "ملعب اقتصادي مناسب للتدريبات",
      ownerName: "حسين محمود",
      address: "شارع 9",
      coverImage:
          "https://images.unsplash.com/photo-1483721310020-03333e577078?q=80&w=800",
      lat: 29.960,
      lng: 31.256,
    ),

    // ======================
    // 🔥 كفر الشيخ
    // ======================

    StadiumModel(
      id: "st_006",
      name: "ملعب الحامول الرياضي",
      governorate: "كفر الشيخ",
      city: "الحامول",
      rating: 4.4,
      pricePerHour: 35,
      openTime: "15:00",
      closeTime: "22:00",
      workingDays: [1, 2, 3, 4, 5, 6, 7],
      description: "ملعب شعبي مجهز بإضاءة ومساحات واسعة",
      ownerName: "محمود السيد",
      address: "طريق الحامول الرئيسي",
      coverImage:
          "https://images.unsplash.com/photo-1508098682722-e99c43a406b2?q=80&w=800",
      lat: 31.311,
      lng: 30.945,
    ),

    StadiumModel(
      id: "st_007",
      name: "ملعب الخلفاء",
      governorate: "كفر الشيخ",
      city: "كفر الشيخ",
      rating: 4.6,
      pricePerHour: 45,
      openTime: "14:00",
      closeTime: "23:30",
      workingDays: [1, 2, 3, 4, 5, 6],
      description: "ملعب حديث بجوار مسجد الخليفة المؤمن",
      ownerName: "عبدالله فوزي",
      address: "منطقة الخليفة المؤمن",
      coverImage:
          "https://images.unsplash.com/photo-1483721310020-03333e577078?q=80&w=800",
      lat: 31.109,
      lng: 30.939,
    ),

    StadiumModel(
      id: "st_008",
      name: "ملعب دسوق الدولي",
      governorate: "كفر الشيخ",
      city: "دسوق",
      rating: 4.8,
      pricePerHour: 55,
      openTime: "16:00",
      closeTime: "01:00",
      workingDays: [1, 2, 3, 4, 5, 6, 7],
      description: "ملعب ممتاز لإقامة البطولات والدورات",
      ownerName: "حسن عبدالتواب",
      address: "شارع البحر – دسوق",
      coverImage:
          "https://images.unsplash.com/photo-1518091043644-c1d4457512c6?q=80&w=800",
      lat: 31.133,
      lng: 30.644,
    ),

    StadiumModel(
      id: "st_009",
      name: "ملعب سيدي سالم",
      governorate: "كفر الشيخ",
      city: "سيدي سالم",
      rating: 4.2,
      pricePerHour: 30,
      openTime: "14:00",
      closeTime: "21:00",
      workingDays: [1, 2, 3, 4, 5],
      description: "ملعب اقتصادي مناسب للتدريبات",
      ownerName: "سعيد إبراهيم",
      address: "المدخل الغربي لسيدي سالم",
      coverImage:
          "https://images.unsplash.com/photo-1521412644187-c49fa049e84d?q=80&w=800",
      lat: 31.271,
      lng: 30.786,
    ),
  ];

  static StadiumModel? getById(String id) {
    for (final s in stadiums) {
      if (s.id == id) return s;
    }
    return null;
  }
}
