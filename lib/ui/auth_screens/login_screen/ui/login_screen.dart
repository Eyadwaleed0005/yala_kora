import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalakora/core/helper/app_system_ui.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/helper/validation_data.dart';
import 'package:yalakora/core/routes/route_names.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/widgets/app_button.dart';
import 'package:yalakora/core/widgets/app_text_field.dart';
import 'package:yalakora/core/widgets/system_ui_wrapper.dart';
import 'package:yalakora/ui/auth_screens/login_screen/logic/cubit/login_cubit.dart';
import 'package:yalakora/ui/auth_screens/sign_up_screen/ui/widgets/already_have_account.dart';
import 'package:yalakora/ui/auth_screens/sign_up_screen/ui/widgets/login_bottom_container.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  void _onLogin(BuildContext context) {
    FocusScope.of(context).unfocus();

    final state = context.read<LoginCubit>().state;
    if (state is LoginLoading) return;

    if (!(_formKey.currentState?.validate() ?? false)) return;

    context.read<LoginCubit>().login();
  }

  @override
  Widget build(BuildContext context) {
    return SystemUiWrapper(
      style: AppSystemUi.dark(),
      child: BlocProvider(
        create: (_) => LoginCubit(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                // Navigation لو حابب
              }
              if (state is LoginError) {
                // Dialog لو حابب
              }
            },
            builder: (context, state) {
              final cubit = context.watch<LoginCubit>();
              final isLoading = state is LoginLoading;

              return Container(
                color: ColorPalette.green,
                child: SafeArea(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              LoginBottomContainer(
                                title: 'تسجيل الدخول',
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      AppTextField(
                                        controller: cubit.emailController,
                                        labelText: 'الإيميل',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        validator: ValidationData.validateEmail,
                                      ),
                                      verticalSpace(16),

                                      AppTextField(
                                        controller: cubit.passwordController,
                                        labelText: 'كلمة السر',
                                        isPassword: true,
                                        textInputAction: TextInputAction.done,
                                        validator:
                                            ValidationData.validatePassword,
                                      ),
                                      verticalSpace(18),

                                      AppButton(
                                        title: 'دخول',
                                        onPressed: () => _onLogin(context),
                                        isLoading: isLoading,
                                      ),
                                      verticalSpace(15),
                                      AlreadyHaveAccount(
                                        questionText: 'لسه معندكش حساب؟ ',
                                        actionText: 'إنشاء حساب',
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            RouteNames.signUpScreen,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
