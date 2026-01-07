import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:yalakora/core/fake_data/fake_user_data.dart';
import 'package:yalakora/core/helper/validation_data.dart';
import 'package:yalakora/core/models/user_model.dart';

part 'profile_screen_state.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState> {
  ProfileScreenCubit() : super(ProfileScreenInitial()) {
    nameController.addListener(_onFieldsChanged);
    phoneController.addListener(_onFieldsChanged);
    loadUser();
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  late UserModel _initialUser;

  Future<void> loadUser() async {
    await Future.delayed(const Duration(milliseconds: 900));
    if (isClosed) return;

    final user = FakeUserData.user;
    _initialUser = user;

    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phone ?? '';

    emit(ProfileScreenLoaded(user: user));
  }

  void _onFieldsChanged() {
    if (isClosed) return;
    if (state is! ProfileScreenLoaded) return;

    final current = state as ProfileScreenLoaded;
    emit(ProfileScreenLoaded(user: current.user, isSaving: current.isSaving));
  }

  bool get hasChanges {
    return nameController.text.trim() != _initialUser.name ||
        phoneController.text.trim() != (_initialUser.phone ?? '');
  }

  bool get isFormValid {
    final nameError = ValidationData.validateName(nameController.text);
    final phoneError = ValidationData.validatePhone(phoneController.text);
    return hasChanges && nameError == null && phoneError == null;
  }

  Future<void> save() async {
    if (state is! ProfileScreenLoaded) return;
    if (!isFormValid) return;

    final current = state as ProfileScreenLoaded;
    emit(ProfileScreenLoaded(user: current.user, isSaving: true));

    await Future.delayed(const Duration(milliseconds: 700));
    if (isClosed) return;

    final updatedUser = UserModel(
      id: current.user.id,
      name: nameController.text.trim(),
      email: current.user.email,
      passwordHash: current.user.passwordHash,
      phone: phoneController.text.trim(),
      avatarUrl: current.user.avatarUrl,
      createdAt: current.user.createdAt,
      updatedAt: DateTime.now(),
    );

    _initialUser = updatedUser;

    emit(ProfileScreenLoaded(user: updatedUser, isSaving: false));
  }

  @override
  Future<void> close() {
    nameController.removeListener(_onFieldsChanged);
    phoneController.removeListener(_onFieldsChanged);

    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
