import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yalakora/core/fake_data/fake_stadiums_data.dart';
import 'package:yalakora/core/helper/stadium_filter_helper.dart';
import 'package:yalakora/core/models/stadium_model.dart';

part 'stadiums_screen_state.dart';

class StadiumsScreenCubit extends Cubit<StadiumsScreenState> {
  StadiumsScreenCubit() : super(const StadiumsScreenState.initial()) {
    load();
  }

  Timer? _timer;

  void load() {
    emit(state.copyWith(isLoading: true));

    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 1), () {
      emit(
        state.copyWith(isLoading: false, stadiums: FakeStadiumsData.stadiums),
      );
    });
  }

  void setQuery(String value) => emit(state.copyWith(query: value));

  void setGovernorateQuery(String value) =>
      emit(state.copyWith(governorateQuery: value));

  void setCityQuery(String value) => emit(state.copyWith(cityQuery: value));

  void clearFilters() {
    emit(state.copyWith(query: '', governorateQuery: '', cityQuery: ''));
  }

  List<StadiumModel> get filteredStadiums {
    return StadiumFilterHelper.filter(
      stadiums: state.stadiums,
      query: state.query,
      governorateQuery: state.governorateQuery,
      cityQuery: state.cityQuery,
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
