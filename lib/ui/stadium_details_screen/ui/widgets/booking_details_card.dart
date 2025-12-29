import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';
import 'package:yalakora/core/widgets/section_title.dart';
import 'package:yalakora/core/helper/stadium_booking_date_helper.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/price_row_widget.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_date_widgets/stadium_dates_strip.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_durations_widgets/stadium_durations_strip.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_time_slots_widgets/stadium_time_slots_grid.dart';

class BookingDetailsCard extends StatefulWidget {
  const BookingDetailsCard({
    super.key,
    required this.dateItems,
    required this.pricePerHour,
    this.onDateSelected,
    this.onDurationSelected,
    this.initialDuration,
  });

  final List<StadiumDateItem> dateItems;
  final num pricePerHour;

  final ValueChanged<DateTime>? onDateSelected;
  final ValueChanged<int>? onDurationSelected;
  final int? initialDuration;

  @override
  State<BookingDetailsCard> createState() => _BookingDetailsCardState();
}

class _BookingDetailsCardState extends State<BookingDetailsCard> {
  String? _selectedSlot;
  bool _selectedIsExtra = false;

  void _selectNormal(String slot) {
    setState(() {
      _selectedSlot = slot;
      _selectedIsExtra = false;
    });
  }

  void _selectExtra(String slot) {
    setState(() {
      _selectedSlot = slot;
      _selectedIsExtra = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    const normalSlots = <SlotUiModel>[
      SlotUiModel(label: '08:00 AM', isDisabled: false),
      SlotUiModel(label: '09:30 AM', isDisabled: false),
      SlotUiModel(label: '11:00 AM', isDisabled: true),
      SlotUiModel(label: '12:30 PM', isDisabled: true),
      SlotUiModel(label: '02:00 PM', isDisabled: false),
      SlotUiModel(label: '03:30 PM', isDisabled: false),
      SlotUiModel(label: '05:00 PM', isDisabled: true),
      SlotUiModel(label: '06:30 PM', isDisabled: true),
    ];

    const extraSlots = <SlotUiModel>[
      SlotUiModel(label: '08:00 PM', isDisabled: false),
      SlotUiModel(label: '09:30 PM', isDisabled: false),
      SlotUiModel(label: '11:00 PM', isDisabled: false),
    ];

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
          StadiumDatesStrip(
            items: widget.dateItems,
            onDateSelected: widget.onDateSelected,
          ),

          verticalSpace(16),

          SectionTitle(
            title: "مدة الحجز",
            textStyle: Textstyles.font15GreySemiBold(),
          ),
          verticalSpace(8),
          StadiumDurationsStrip(
            initialDuration: widget.initialDuration,
            onDurationSelected: widget.onDurationSelected,
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
            selectedSlot: _selectedIsExtra ? null : _selectedSlot,
            onSlotSelected: _selectNormal,
          ),
          verticalSpace(12),
          Divider(color: ColorPalette.lightGrey, thickness: 1.h),
          verticalSpace(8),
          if (extraSlots.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.info_outline, size: 16.sp, color: ColorPalette.grey),
                horizontalSpace(6),
                SectionTitle(
                  title: "مواعيد إضافية",
                  textStyle: Textstyles.font15GreySemiBold(),
                ),
              ],
            ),
            StadiumTimeSlotsGrid(
              slots: extraSlots,
              selectedSlot: _selectedIsExtra ? _selectedSlot : null,
              onSlotSelected: _selectExtra,
            ),
          ],
          verticalSpace(14),
          Divider(color: ColorPalette.lightGrey, thickness: 1.h),
          verticalSpace(10),
          PriceRowWidget(pricePerHour: widget.pricePerHour),
        ],
      ),
    );
  }
}
