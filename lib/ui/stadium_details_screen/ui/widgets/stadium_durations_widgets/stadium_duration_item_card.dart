import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class StadiumDurationItemCard extends StatelessWidget {
  const StadiumDurationItemCard({
    super.key,
    required this.minutes,
    required this.isSelected,
    this.onTap,
  });

  final int minutes;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected ? ColorPalette.green : Colors.white;
    final borderColor = isSelected
        ? ColorPalette.green
        : ColorPalette.borderGrey;
    final mainTextColor = isSelected
        ? ColorPalette.white
        : ColorPalette.darkBlue;
    final secondaryTextColor = isSelected
        ? ColorPalette.white.withOpacity(.9)
        : ColorPalette.grey;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              minutes.toString(),
              style: Textstyles.font16DarkBlueMedium().copyWith(
                color: mainTextColor,
                fontSize: 18.sp,
              ),
            ),
            verticalSpace(2),
            Text(
              'دقيقة',
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
