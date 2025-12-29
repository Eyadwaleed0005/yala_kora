import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class StadiumTimeSlotItemCard extends StatelessWidget {
  const StadiumTimeSlotItemCard({
    super.key,
    required this.label,
    required this.isSelected,
    this.isDisabled = false,
    this.onTap,
  });

  final String label;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? ColorPalette.green
        : isDisabled
        ? ColorPalette.disabledBackground
        : ColorPalette.white;

    final borderColor = isSelected
        ? ColorPalette.green
        : isDisabled
        ? ColorPalette.disabledBorder
        : ColorPalette.borderGrey;

    final textColor = isSelected
        ? ColorPalette.white
        : isDisabled
        ? ColorPalette.disabledText
        : ColorPalette.darkBlue;

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Textstyles.font14GreyRegular().copyWith(
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (isDisabled) ...[
              horizontalSpace(6),
              Icon(
                Icons.lock_outline,
                size: 16.sp,
                color: ColorPalette.disabledText,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
