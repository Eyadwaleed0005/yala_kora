import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalakora/core/helper/app_system_ui.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/routes/route_names.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/widgets/system_ui_wrapper.dart';
import 'package:yalakora/ui/splash_screen/logic/cubit/splash_screen_cubit.dart';
import 'package:yalakora/ui/splash_screen/logic/cubit/splash_screen_state.dart';

import 'widgets/splash_app_name.dart';
import 'widgets/splash_loading_dots.dart';
import 'widgets/splash_logo.dart';
import 'widgets/splash_tagline.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashScreenCubit()..checkToken(),
      child: BlocListener<SplashScreenCubit, SplashScreenState>(
        listenWhen: (_, state) =>
            state is SplashShowStart ||
            state is SplashHasToken ||
            state is SplashNoToken,
        listener: (context, state) {
          if (!context.mounted) return;

          if (state is SplashShowStart) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.startScreen,
              (route) => false,
            );
          } else if (state is SplashHasToken) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.homeScreen,
              (route) => false,
            );
          } else if (state is SplashNoToken) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.loginScreen,
              (route) => false,
            );
          }
        },
        child: SystemUiWrapper(
          style: AppSystemUi.light(),
          child: Scaffold(
            backgroundColor: ColorPalette.offWhite,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SplashLogo(),
                    verticalSpace(12),
                    const SplashAppName(),
                    verticalSpace(17),
                    const SplashTagline(),
                    verticalSpace(25),
                    const SplashLoadingDots(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
