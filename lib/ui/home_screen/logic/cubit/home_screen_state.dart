part of 'home_screen_cubit.dart';

@immutable
class HomeScreenState {
  final bool isLoading;
  final int currentIndex;
  final List<StadiumModel> stadiums;

  const HomeScreenState({
    required this.isLoading,
    required this.currentIndex,
    required this.stadiums,
  });

  const HomeScreenState.initial()
      : isLoading = true,
        currentIndex = 0,
        stadiums = const [];

  HomeScreenState copyWith({
    bool? isLoading,
    int? currentIndex,
    List<StadiumModel>? stadiums,
  }) {
    return HomeScreenState(
      isLoading: isLoading ?? this.isLoading,
      currentIndex: currentIndex ?? this.currentIndex,
      stadiums: stadiums ?? this.stadiums,
    );
  }

  List<StadiumModel> get displayedStadiums => stadiums.take(3).toList();
}
