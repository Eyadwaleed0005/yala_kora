import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class StadiumRatingPill extends StatelessWidget {
  const StadiumRatingPill({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: ColorPalette.orange,
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            rating.toStringAsFixed(1),
            style: Textstyles.font13whitebold(),
            strutStyle: const StrutStyle(
              forceStrutHeight: true,
            ),
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
          ),
          horizontalSpace(2),
          Icon(
            Icons.star_rounded,
            color: ColorPalette.white,
            size: 18.sp,
          ),
        ],
      ),
    );
  }
}
