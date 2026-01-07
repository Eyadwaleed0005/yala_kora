import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/app_system_ui.dart';
import 'package:yalakora/core/helper/bottom_nav_router.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/routes/route_names.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/widgets/app_bottom_nav_bar.dart';
import 'package:yalakora/core/widgets/app_search_field.dart';
import 'package:yalakora/core/widgets/system_ui_wrapper.dart';
import 'package:yalakora/core/widgets/stadium_location_text_filter.dart';
import 'package:yalakora/core/widgets/stadium_booking_card/stadium_booking_card.dart';
import 'package:yalakora/core/widgets/stadium_booking_card/stadium_booking_card_skeleton.dart';
import 'package:yalakora/ui/stadiums_screen/logic/cubit/stadiums_screen_cubit.dart';

class StadiumsScreen extends StatefulWidget {
  const StadiumsScreen({super.key});

  @override
  State<StadiumsScreen> createState() => _StadiumsScreenState();
}

class _StadiumsScreenState extends State<StadiumsScreen> {
  final _searchController = TextEditingController();
  final _govController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    _govController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StadiumsScreenCubit(),
      child: BlocBuilder<StadiumsScreenCubit, StadiumsScreenState>(
        builder: (context, state) {
          final cubit = context.read<StadiumsScreenCubit>();
          final data = cubit.filteredStadiums;

          if (_searchController.text != state.query) {
            _searchController.value = TextEditingValue(
              text: state.query,
              selection: TextSelection.collapsed(offset: state.query.length),
            );
          }
          if (_govController.text != state.governorateQuery) {
            _govController.value = TextEditingValue(
              text: state.governorateQuery,
              selection: TextSelection.collapsed(
                offset: state.governorateQuery.length,
              ),
            );
          }
          if (_cityController.text != state.cityQuery) {
            _cityController.value = TextEditingValue(
              text: state.cityQuery,
              selection:
                  TextSelection.collapsed(offset: state.cityQuery.length),
            );
          }

          return SystemUiWrapper(
            style: AppSystemUi.dark(),
            child: Scaffold(
              backgroundColor: ColorPalette.offWhite,
              bottomNavigationBar: AppBottomNavBar(
                currentIndex: 2,
                onTap: (index) => BottomNavRouter.go(context, index),
              ),
              body: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                  child: Column(
                    children: [
                      AppSearchField(
                        controller: _searchController,
                        onChanged: cubit.setQuery,
                      ),
                      verticalSpace(12),
                      StadiumLocationTextFilter(
                        governorateController: _govController,
                        cityController: _cityController,
                        onGovernorateChanged: cubit.setGovernorateQuery,
                        onCityChanged: cubit.setCityQuery,
                        onClear: () {
                          cubit.clearFilters();
                          _searchController.clear();
                          _govController.clear();
                          _cityController.clear();
                        },
                      ),
                      verticalSpace(12),
                      Expanded(
                        child: state.isLoading
                            ? ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: 6,
                                separatorBuilder: (_, __) =>
                                    verticalSpace(12),
                                itemBuilder: (_, __) =>
                                    const StadiumBookingCardSkeleton(),
                              )
                            : data.isEmpty
                                ? const Center(child: Text('لا توجد نتائج'))
                                : ListView.separated(
                                    physics:
                                        const BouncingScrollPhysics(),
                                    itemCount: data.length,
                                    separatorBuilder: (_, __) =>
                                        verticalSpace(12),
                                    itemBuilder: (context, index) {
                                      final stadium = data[index];
                                      return StadiumBookingCard(
                                        stadiumName: stadium.name,
                                        location: stadium.location,
                                        imageUrl: stadium.coverImage,
                                        rating: stadium.rating,
                                        onBookTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            RouteNames
                                                .stadiumDetailsScreen,
                                            arguments: stadium.id,
                                          );
                                        },
                                      );
                                    },
                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
