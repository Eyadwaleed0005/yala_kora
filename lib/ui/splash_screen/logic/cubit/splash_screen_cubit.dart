import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalakora/core/local/secure_storage.dart';
import 'package:yalakora/core/local/secure_storage_keys.dart';
import 'package:yalakora/core/local/shared_preference_keys.dart';
import 'package:yalakora/core/local/shared_preferences.dart';
import 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  Future<void> checkToken() async {
    if (isClosed) return;
    emit(SplashScreenLoading());

    await Future.delayed(const Duration(milliseconds: 1700));
    if (isClosed) return;

    final bool viewed =
        (await SharedPreferencesHelper.getBool(
              key: SharedPreferenceKeys.startScreenViewed,
            )) ??
            false;

    if (isClosed) return;

    if (!viewed) {
      emit(SplashShowStart());
      return;
    }

    final String? token = await SecureStorageHelper.getData(
      key: SecureStorageKeys.token,
    );

    if (isClosed) return;

    if (token != null && token.trim().isNotEmpty) {
      emit(SplashHasToken());
    } else {
      emit(SplashNoToken());
    }
  }
}
