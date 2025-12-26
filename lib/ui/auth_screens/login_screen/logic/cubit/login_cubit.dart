import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoading());

    // محاكاة تسجيل دخول بدون API
    await Future.delayed(const Duration(milliseconds: 700));

    emit(LoginSuccess(message: 'تم تسجيل الدخول بنجاح'));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
