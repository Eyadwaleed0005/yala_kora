import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yalakora/core/fake_data/fake_stadiums_data.dart';
import 'package:yalakora/core/models/stadium_model.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState.initial()) {
    _load();
  }

  Timer? _timer;

  void _load() {
    emit(state.copyWith(isLoading: true));

    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 2), () {
      emit(state.copyWith(
        isLoading: false,
        stadiums: FakeStadiumsData.stadiums,
      ));
    });
  }

  void changeTab(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void refresh() {
    _load();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
