part of 'profile_screen_cubit.dart';

@immutable
sealed class ProfileScreenState {}

final class ProfileScreenInitial extends ProfileScreenState {}

final class ProfileScreenLoaded extends ProfileScreenState {
  final UserModel user;
  final bool isSaving;

  ProfileScreenLoaded({
    required this.user,
    this.isSaving = false,
  });
}
