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
import 'package:yalakora/ui/auth_screens/sign_up_screen/logic/sign_up_cubit.dart';
import 'package:yalakora/ui/auth_screens/sign_up_screen/ui/widgets/already_have_account.dart';
import 'package:yalakora/ui/auth_screens/sign_up_screen/ui/widgets/login_bottom_container.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  void _onSignUp(BuildContext context) {
    FocusScope.of(context).unfocus();
    final state = context.read<SignUpCubit>().state;
    if (state is SignUpLoading) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<SignUpCubit>().signUp();
  }

  @override
  Widget build(BuildContext context) {
    return SystemUiWrapper(
      style: AppSystemUi.dark(),
      child: BlocProvider(
        create: (_) => SignUpCubit(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = context.watch<SignUpCubit>();
              final isLoading = state is SignUpLoading;

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
                                title: 'إنشاء حساب',
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      AppTextField(
                                        controller: cubit.nameController,
                                        labelText: 'الاسم الكامل',
                                        textInputAction: TextInputAction.next,
                                        validator: ValidationData.validateName,
                                      ),
                                      verticalSpace(16),
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
                                        controller: cubit.phoneController,
                                        labelText: 'رقم الهاتف',
                                        keyboardType: TextInputType.phone,
                                        textInputAction: TextInputAction.next,
                                        validator: ValidationData.validatePhone,
                                      ),
                                      verticalSpace(16),
                                      AppTextField(
                                        controller: cubit.passwordController,
                                        labelText: 'كلمة السر',
                                        isPassword: true,
                                        textInputAction: TextInputAction.next,
                                        validator:
                                            ValidationData.validatePassword,
                                      ),
                                      verticalSpace(16),
                                      AppTextField(
                                        controller:
                                            cubit.confirmPasswordController,
                                        labelText: 'تأكيد كلمة السر',
                                        isPassword: true,
                                        textInputAction: TextInputAction.done,
                                        validator: (value) =>
                                            ValidationData.validateConfirmPassword(
                                              value: value,
                                              password:
                                                  cubit.passwordController.text,
                                            ),
                                      ),
                                      verticalSpace(18),
                                      AppButton(
                                        title: 'تسجيل',
                                        onPressed: () => _onSignUp(context),
                                        isLoading: isLoading,
                                      ),
                                      verticalSpace(15),
                                      AlreadyHaveAccount(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            RouteNames.loginScreen,
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
