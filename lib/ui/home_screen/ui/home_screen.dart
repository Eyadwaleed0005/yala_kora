import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/app_system_ui.dart';
import 'package:yalakora/core/helper/bottom_nav_router.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/routes/route_names.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/widgets/app_bottom_nav_bar.dart';
import 'package:yalakora/core/widgets/section_title.dart';
import 'package:yalakora/core/widgets/system_ui_wrapper.dart';
import 'package:yalakora/ui/home_screen/logic/cubit/home_screen_cubit.dart';
import 'package:yalakora/ui/home_screen/ui/widgets/home_header.dart';
import 'package:yalakora/ui/home_screen/ui/widgets/home_hero_card.dart';
import 'package:yalakora/core/widgets/stadium_booking_card/stadium_booking_card.dart';
import 'package:yalakora/core/widgets/stadium_booking_card/stadium_booking_card_skeleton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeScreenCubit(),
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          return SystemUiWrapper(
            style: AppSystemUi.dark(),
            child: Scaffold(
              backgroundColor: ColorPalette.offWhite,
              bottomNavigationBar: AppBottomNavBar(
                currentIndex: 0,
                onTap: (index) => BottomNavRouter.go(context, index),
              ),
              body: Column(
                children: [
                  HomeHeader(
                    userName: "إياد وليد",
                    onMenuTap: () {},
                    onNotificationsTap: () {},
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(12),
                          const HomeHeroCard(),
                          verticalSpace(16),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: const SectionTitle(title: "احجز الان"),
                          ),
                          verticalSpace(12),
                          ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.isLoading
                                ? 3
                                : state.displayedStadiums.length,
                            itemBuilder: (context, index) {
                              if (state.isLoading) {
                                return const StadiumBookingCardSkeleton();
                              }
                              final item = state.displayedStadiums[index];
                              return StadiumBookingCard(
                                stadiumName: item.name,
                                location: item.location,
                                imageUrl: item.coverImage,
                                rating: item.rating,
                                onBookTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteNames.stadiumDetailsScreen,
                                    arguments: item.id,
                                  );
                                },
                              );
                            },
                            separatorBuilder: (_, __) => SizedBox(height: 12.h),
                          ),
                          verticalSpace(24),
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
    );
  }
}
