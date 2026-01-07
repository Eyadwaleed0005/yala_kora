import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/app_system_ui.dart';
import 'package:yalakora/core/helper/bottom_nav_router.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/helper/validation_data.dart';
import 'package:yalakora/core/routes/app_images_routes.dart';
import 'package:yalakora/core/routes/route_names.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/widgets/app_bottom_nav_bar.dart';
import 'package:yalakora/core/widgets/app_button.dart';
import 'package:yalakora/core/widgets/system_ui_wrapper.dart';
import 'package:yalakora/core/widgets/app_text_field.dart';
import 'package:yalakora/ui/profile_screen/logic/cubit/profile_screen_cubit.dart';
import 'package:yalakora/ui/profile_screen/ui/widget/image_profile_widgets/image_profile.dart';
import 'package:yalakora/ui/profile_screen/ui/widget/profile_option_section.dart';
import 'package:yalakora/ui/profile_screen/ui/widget/profile_screen_skeleton.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileScreenCubit(),
      child: SystemUiWrapper(
        style: AppSystemUi.dark(),
        child: Scaffold(
          backgroundColor: ColorPalette.offWhite,
          body: BlocBuilder<ProfileScreenCubit, ProfileScreenState>(
            builder: (context, state) {
              final cubit = context.read<ProfileScreenCubit>();

              if (state is! ProfileScreenLoaded) {
                return const ProfileScreenSkeleton();
              }

              final user = state.user;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 150.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorPalette.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        ),
                      ),
                      child: SafeArea(
                        bottom: false,
                        child: Center(
                          child: ImageProfile(
                            imageUrl: user.avatarUrl,
                            defaultAssetPath: AppImage().defaultProfileImage,
                            radius: 50.r,
                            onEditTap: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: Column(
                        children: [
                          AppTextField(
                            controller: cubit.nameController,
                            labelText: 'الاسم',
                            prefixIcon: Icons.person_outline_rounded,
                            validator: ValidationData.validateName,
                          ),
                          verticalSpace(12),
                          AppTextField(
                            controller: cubit.emailController,
                            labelText: 'البريد الإلكتروني',
                            prefixIcon: Icons.email_outlined,
                            enabled: false,
                          ),
                          verticalSpace(12),
                          AppTextField(
                            controller: cubit.phoneController,
                            labelText: 'رقم الهاتف',
                            prefixIcon: Icons.phone_outlined,
                            keyboardType: TextInputType.phone,
                            validator: ValidationData.validatePhone,
                          ),
                          verticalSpace(16),
                          ProfileOptionSection(
                            title: 'فريقي',
                            subtitle: 'إدارة اللاعبين والتشكيلة',
                            icon: Icons.groups_2_rounded,
                            iconColor: ColorPalette.green,
                            onTap: () => Navigator.pushNamed(
                              context,
                              RouteNames.startScreen,
                            ),
                          ),
                          verticalSpace(12),
                          ProfileOptionSection(
                            title: 'الإعدادات',
                            subtitle: 'التحكم في الحساب والتطبيق',
                            icon: Icons.settings_rounded,
                            iconColor: ColorPalette.darkBlue,
                            onTap: () => Navigator.pushNamed(
                              context,
                              RouteNames.startScreen,
                            ),
                          ),
                          verticalSpace(50),
                          AppButton(
                            title: 'حفظ التعديلات',
                            isEnabled: cubit.isFormValid,
                            isLoading: state.isSaving,
                            onPressed: cubit.save,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: AppBottomNavBar(
            currentIndex: 4,
            onTap: (index) => BottomNavRouter.go(context, index),
          ),
        ),
      ),
    );
  }
}
