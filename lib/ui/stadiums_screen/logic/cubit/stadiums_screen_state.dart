part of 'stadiums_screen_cubit.dart';

@immutable
class StadiumsScreenState {
  const StadiumsScreenState({
    required this.isLoading,
    required this.stadiums,
    required this.query,
    required this.governorateQuery,
    required this.cityQuery,
  });

  final bool isLoading;
  final List<StadiumModel> stadiums;

  final String query;             // بحث عام
  final String governorateQuery;  // يكتب المحافظة
  final String cityQuery;         // يكتب المركز/المدينة

  const StadiumsScreenState.initial()
      : isLoading = false,
        stadiums = const [],
        query = '',
        governorateQuery = '',
        cityQuery = '';

  StadiumsScreenState copyWith({
    bool? isLoading,
    List<StadiumModel>? stadiums,
    String? query,
    String? governorateQuery,
    String? cityQuery,
  }) {
    return StadiumsScreenState(
      isLoading: isLoading ?? this.isLoading,
      stadiums: stadiums ?? this.stadiums,
      query: query ?? this.query,
      governorateQuery: governorateQuery ?? this.governorateQuery,
      cityQuery: cityQuery ?? this.cityQuery,
    );
  }
}
