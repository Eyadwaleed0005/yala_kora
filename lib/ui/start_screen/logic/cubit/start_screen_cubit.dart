import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalakora/core/local/shared_preference_keys.dart';
import 'package:yalakora/core/local/shared_preferences.dart';
import 'start_screen_state.dart';

class StartScreenCubit extends Cubit<StartScreenState> {
  StartScreenCubit() : super(StartScreenInitial());

  int currentIndex = 0;

  void changePage(int index) {
    if (index == currentIndex) return;
    currentIndex = index;
    emit(StartScreenPageChanged(index));
  }

  // ✅ نفس BoneDetect
  Future<void> markAsViewed() async {
    await SharedPreferencesHelper.saveBool(
      key: SharedPreferenceKeys.startScreenViewed,
      value: true,
    );
  }

  Future<void> finish() async {
    if (state is StartScreenLoading) return;

    emit(StartScreenLoading());

    await markAsViewed();

    emit(StartScreenNavigateToLogin());
  }
}
