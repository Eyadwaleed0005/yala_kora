import 'package:yalakora/core/models/stadium_model.dart';

class StadiumFilterHelper {
  const StadiumFilterHelper._();

  static bool _contains(String source, String query) {
    final s = source.trim().toLowerCase();
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return true;
    return s.contains(q);
  }

  static List<StadiumModel> filter({
    required List<StadiumModel> stadiums,
    required String query,
    required String governorateQuery,
    required String cityQuery,
  }) {
    final nameQ = query.trim();
    final govQ = governorateQuery.trim();
    final cityQ = cityQuery.trim();

    return stadiums.where((s) {
      final matchesName = _contains(s.name, nameQ);
      final matchesGov = _contains(s.governorate, govQ);
      final matchesCity = _contains(s.city, cityQ);

      return matchesName && matchesGov && matchesCity;
    }).toList();
  }
}
