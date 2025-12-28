import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class StadiumDateItemCard extends StatelessWidget {
  const StadiumDateItemCard({
    super.key,
    required this.dayName,
    required this.dayNumber,
    required this.monthName,
    required this.isOpen,
    required this.isSelected,
    this.onTap,
  });

  final String dayName;
  final String dayNumber;
  final String monthName;
  final bool isOpen;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bgColor = !isOpen
        ? ColorPalette.lightGrey
        : isSelected
        ? ColorPalette.green
        : Colors.white;

    final borderColor = isSelected
        ? ColorPalette.green
        : ColorPalette.borderGrey;

    final textColor = !isOpen
        ? ColorPalette.grey
        : isSelected
        ? ColorPalette.white
        : ColorPalette.darkBlue;

    final secondaryTextColor = !isOpen
        ? ColorPalette.grey
        : isSelected
        ? Colors.white.withOpacity(.95)
        : ColorPalette.grey;
    return GestureDetector(
      onTap: isOpen ? onTap : null,
      child: Container(
        width: 72.w,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayName,
              style: Textstyles.font14GreyRegular().copyWith(
                color: secondaryTextColor,
              ),
            ),
            verticalSpace(6),
            Text(
              dayNumber,
              style: Textstyles.font16DarkBlueMedium().copyWith(
                color: textColor,
                fontSize: 18.sp,
              ),
            ),
            Text(
              monthName,
              style: Textstyles.font14GreyRegular().copyWith(
                color: secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
