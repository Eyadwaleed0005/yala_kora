import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';
import 'package:yalakora/core/widgets/section_title.dart';
import 'package:yalakora/core/helper/stadium_booking_date_helper.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_date_widgets/stadium_dates_strip.dart';

class BookingDetailsCard extends StatelessWidget {
  const BookingDetailsCard({
    super.key,
    required this.dateItems,
    this.onDateSelected,
  });

  final List<StadiumDateItem> dateItems;
  final ValueChanged<DateTime>? onDateSelected;

  @override
  Widget build(BuildContext context) {
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
          verticalSpace(18),
          SectionTitle(
            title: "الوقت المتاح",
            textStyle: Textstyles.font15GreySemiBold(),
          ),
        ],
      ),
    );
  }
}
