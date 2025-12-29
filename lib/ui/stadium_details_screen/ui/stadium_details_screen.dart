import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yalakora/core/fake_data/fake_bookings_data.dart';
import 'package:yalakora/core/fake_data/fake_stadiums_data.dart';
import 'package:yalakora/core/helper/app_system_ui.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';
import 'package:yalakora/core/widgets/section_title.dart';
import 'package:yalakora/core/widgets/system_ui_wrapper.dart';
import 'package:yalakora/core/helper/stadium_booking_date_helper.dart';
import 'package:yalakora/ui/stadium_details_screen/logic/cubit/stadium_details_screen_cubit.dart';
import 'package:yalakora/ui/stadium_details_screen/logic/cubit/stadium_details_screen_state.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/green_outline_action_button.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_basic_info_card.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_details_cover.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/booking_details_card.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/booking_confirm_button.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_time_slots_widgets/stadium_time_slots_grid.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_description.dart';

class StadiumDetailsScreen extends StatelessWidget {
  const StadiumDetailsScreen({super.key, required this.stadiumId});

  final String stadiumId;

  String? _findSelectedLabel(StadiumDetailsScreenState state) {
    if (state.selectedSlotStart == null) return null;
    final list = state.selectedIsExtra ? state.extraSlots : state.normalSlots;
    final found = list
        .where((e) => e.start == state.selectedSlotStart)
        .toList();
    if (found.isEmpty) return null;
    return found.first.label;
  }

  @override
  Widget build(BuildContext context) {
    final stadium = FakeStadiumsData.getById(stadiumId)!;

    final dateItems = StadiumBookingDateHelper.buildDateStrip(
      workingDays: stadium.workingDays,
      count: 8,
    );

    final initialDay = dateItems.first.date;

    final initialBookings = FakeBookingsData.bookingsForDay(
      stadiumId: stadium.id!,
      selectedDay: initialDay,
    );

    return BlocProvider(
      create: (_) {
        final cubit = StadiumDetailsScreenCubit();
        cubit.init(
          stadium: stadium,
          bookings: initialBookings,
          initialDuration: 60,
          initialDate: initialDay,
        );
        return cubit;
      },
      child: SystemUiWrapper(
        style: AppSystemUi.dark(),
        child: Scaffold(
          backgroundColor: ColorPalette.offWhite,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StadiumDetailsCover(
                  imageUrl: stadium.coverImage,
                  rating: stadium.rating,
                  onFavoriteTap: () {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(
                        title: "تفاصيل الملعب",
                        textStyle: Textstyles.font17DarkBlueMedium(),
                      ),
                      verticalSpace(15),

                      StadiumBasicInfoCard(
                        stadiumName: stadium.name,
                        ownerName: stadium.ownerName ?? '',
                        location: stadium.location,
                        address: stadium.address ?? '',
                      ),

                      verticalSpace(20),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GreenOutlineActionButton(
                              title: 'الخريطة',
                              icon: Icons.location_on_outlined,
                              onTap: () {},
                            ),
                            horizontalSpace(8),
                            GreenOutlineActionButton(
                              title: 'واتساب',
                              icon: FontAwesomeIcons.whatsapp,
                              onTap: () {},
                            ),
                            horizontalSpace(8),
                            GreenOutlineActionButton(
                              title: 'اتصال',
                              icon: Icons.call_outlined,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(20),
                      BlocBuilder<
                        StadiumDetailsScreenCubit,
                        StadiumDetailsScreenState
                      >(
                        builder: (context, state) {
                          final cubit = context
                              .read<StadiumDetailsScreenCubit>();

                          final normalUi = state.normalSlots
                              .map(
                                (e) => SlotUiModel(
                                  label: e.label,
                                  isDisabled: e.isDisabled,
                                ),
                              )
                              .toList();

                          final extraUi = state.extraSlots
                              .map(
                                (e) => SlotUiModel(
                                  label: e.label,
                                  isDisabled: e.isDisabled,
                                ),
                              )
                              .toList();

                          final selectedLabel = _findSelectedLabel(state);
                          return Column(
                            children: [
                              BookingDetailsCard(
                                dateItems: dateItems,
                                pricePerHour: stadium.pricePerHour ?? 0,
                                normalSlots: normalUi,
                                extraSlots: extraUi,
                                selectedSlotLabel: selectedLabel,
                                selectedIsExtra: state.selectedIsExtra,
                                isSlotsEnabled:
                                    state.selectedDate != null &&
                                    state.selectedDuration != null,
                                initialDuration: 60,
                                onDateSelected: (d) {
                                  final bookings =
                                      FakeBookingsData.bookingsForDay(
                                        stadiumId: stadium.id!,
                                        selectedDay: d,
                                      );
                                  cubit.selectDate(d);
                                  cubit.updateBookings(bookings);
                                },
                                onDurationSelected: (m) {
                                  final day = state.selectedDate ?? initialDay;
                                  final bookings =
                                      FakeBookingsData.bookingsForDay(
                                        stadiumId: stadium.id!,
                                        selectedDay: day,
                                      );
                                  cubit.updateBookings(bookings);
                                  cubit.selectDuration(m);
                                },
                                onSlotSelected: (label, isExtra) =>
                                    cubit.selectSlotByLabel(
                                      label: label,
                                      isExtra: isExtra,
                                    ),
                              ),
                              verticalSpace(14),
                              StadiumDescription(
                                description: stadium.description ?? '',
                                maxLines: 3,
                              ),
                              verticalSpace(20),
                              BookingConfirmButton(
                                isEnabled: cubit.canSubmit,
                                isLoading: state.isSubmitting,
                                onPressed: () => cubit.submitBooking(),
                              ),
                            ],
                          );
                        },
                      ),
                      verticalSpace(2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
