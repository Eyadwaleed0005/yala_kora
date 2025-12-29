import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/helper/stadium_booking_date_helper.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';
import 'package:yalakora/core/widgets/section_title.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/price_row_widget.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_date_widgets/stadium_dates_strip.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_durations_widgets/stadium_durations_strip.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_time_slots_widgets/extra_slots_header.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_time_slots_widgets/stadium_time_slots_grid.dart';

class BookingDetailsCard extends StatelessWidget {
  const BookingDetailsCard({
    super.key,
    required this.dateItems,
    required this.pricePerHour,
    required this.normalSlots,
    required this.extraSlots,
    required this.selectedSlotLabel,
    required this.selectedIsExtra,
    required this.isSlotsEnabled,
    this.onDateSelected,
    this.onDurationSelected,
    this.onSlotSelected,
    this.initialDuration,
  });

  final List<StadiumDateItem> dateItems;
  final num pricePerHour;

  final List<SlotUiModel> normalSlots;
  final List<SlotUiModel> extraSlots;

  final String? selectedSlotLabel;
  final bool selectedIsExtra;
  final bool isSlotsEnabled;

  final ValueChanged<DateTime>? onDateSelected;
  final ValueChanged<int>? onDurationSelected;
  final void Function(String label, bool isExtra)? onSlotSelected;

  final int? initialDuration;

  @override
  Widget build(BuildContext context) {
    final bool hasExtraSlots = extraSlots.isNotEmpty;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: ColorPalette.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 14.r,
            spreadRadius: 1.r,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6.r,
            spreadRadius: -1.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: "احجز ملعبك",
            textStyle: Textstyles.font17DarkBlueMedium(),
          ),
          verticalSpace(8),
          SectionTitle(
            title: "التاريخ",
            textStyle: Textstyles.font15GreySemiBold(),
          ),
          verticalSpace(8),
          StadiumDatesStrip(items: dateItems, onDateSelected: onDateSelected),
          verticalSpace(16),
          SectionTitle(
            title: "مدة الحجز",
            textStyle: Textstyles.font15GreySemiBold(),
          ),
          verticalSpace(8),
          StadiumDurationsStrip(
            initialDuration: initialDuration,
            onDurationSelected: onDurationSelected,
          ),
          verticalSpace(10),
          SectionTitle(
            title: "اختر مدة الحجز لتحديد المواعيد المتاحة",
            textStyle: Textstyles.font10GreyMedium(),
          ),
          verticalSpace(18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "المواعيد تتغير حسب اليوم المختار",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: Textstyles.font10GreyMedium(),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SectionTitle(
                    title: "المواعيد",
                    textStyle: Textstyles.font15GreySemiBold(),
                  ),
                  SectionTitle(
                    title: "المتاحة",
                    textStyle: Textstyles.font15GreySemiBold(),
                  ),
                ],
              ),
            ],
          ),
          StadiumTimeSlotsGrid(
            slots: normalSlots,
            selectedSlot: selectedIsExtra ? null : selectedSlotLabel,
            onSlotSelected: (label) => onSlotSelected?.call(label, false),
            isEnabled: isSlotsEnabled,
          ),
          if (hasExtraSlots) ...[
            verticalSpace(12),
            Divider(color: ColorPalette.lightGrey, thickness: 1.h),
            verticalSpace(8),
            ExtraSlotsHeader(),
            StadiumTimeSlotsGrid(
              slots: extraSlots,
              selectedSlot: selectedIsExtra ? selectedSlotLabel : null,
              onSlotSelected: (label) => onSlotSelected?.call(label, true),
              isEnabled: isSlotsEnabled,
            ),
            verticalSpace(14),
            Divider(color: ColorPalette.lightGrey, thickness: 1.h),
          ] else ...[
            verticalSpace(14),
            Divider(color: ColorPalette.lightGrey, thickness: 1.h),
          ],
          verticalSpace(10),
          PriceRowWidget(pricePerHour: pricePerHour),
        ],
      ),
    );
  }
}
