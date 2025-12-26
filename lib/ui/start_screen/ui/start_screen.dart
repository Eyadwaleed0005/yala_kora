import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/app_system_ui.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/routes/app_images_routes.dart';
import 'package:yalakora/core/routes/route_names.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/widgets/system_ui_wrapper.dart';
import 'package:yalakora/ui/start_screen/logic/cubit/start_screen_cubit.dart';
import 'package:yalakora/ui/start_screen/logic/cubit/start_screen_state.dart';

import 'widgets/start_continue_button.dart';
import 'widgets/start_dots.dart';
import 'widgets/start_header.dart';
import 'widgets/start_hero.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late final PageController _controller;

  final List<Map<String, String>> _pages = [
    {
      'image': AppImage().onboarding1,
      'title': 'احجز ملعب قريب بسهولة',
      'desc': 'اختار المكان والوقت المناسبين واحجز في ثواني.',
    },
    {
      'image': AppImage().onboarding2,
      'title': 'متابعة الحجوزات والتنبيهات',
      'desc': 'اعرف مواعيدك وتنبيهاتك أول بأول.',
    },
    {
      'image': AppImage().onboarding3,
      'title': 'اشتري مستلزماتك بسرعة',
      'desc': 'كل اللي تحتاجه لكرة القدم في مكان واحد.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StartScreenCubit(),
      child: BlocListener<StartScreenCubit, StartScreenState>(
        listenWhen: (_, state) => state is StartScreenNavigateToLogin,
        listener: (context, state) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.loginScreen,
            (r) => false,
          );
        },
        child: SystemUiWrapper(
          style: AppSystemUi.light(),
          child: Scaffold(
            backgroundColor: ColorPalette.offWhite,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                child: BlocBuilder<StartScreenCubit, StartScreenState>(
                  builder: (context, state) {
                    final cubit = context.watch<StartScreenCubit>();

                    final bool loading = state is StartScreenLoading;
                    final bool isLast = cubit.currentIndex == _pages.length - 1;

                    return Column(
                      children: [
                        StartHeader(
                          onSkip: loading
                              ? () {}
                              : () => context.read<StartScreenCubit>().finish(),
                        ),
                        verticalSpace(10),
                        Expanded(
                          child: PageView.builder(
                            controller: _controller,
                            itemCount: _pages.length,
                            onPageChanged: (i) =>
                                context.read<StartScreenCubit>().changePage(i),
                            itemBuilder: (context, index) {
                              final p = _pages[index];
                              return StartHero(
                                imagePath: p['image']!,
                                title: p['title']!,
                                description: p['desc']!,
                              );
                            },
                          ),
                        ),
                        verticalSpace(14),
                        StartDots(activeIndex: cubit.currentIndex),
                        verticalSpace(18),
                        StartContinueButton(
                          isLoading: loading,
                          text: isLast ? 'ابدأ' : 'متابعة',
                          onPressed: loading
                              ? null
                              : () {
                                  if (!isLast) {
                                    _nextPage();
                                  } else {
                                    context.read<StartScreenCubit>().finish();
                                  }
                                },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
