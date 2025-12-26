import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class HomeHeroCard extends StatelessWidget {
  const HomeHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorPalette.borderGrey),
          boxShadow: [
            BoxShadow(
              color: ColorPalette.overlayGrey,
              blurRadius: 18.r,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "احجز ملعبك بسهولة",
                    style: Textstyles.font22darkBlueExtraBold(),
                  ),
                  verticalSpace(6),
                  Text(
                    "اختار ملعب قريب منك، شوف التقييم والمكان واحجز فورًا.",
                    style: Textstyles.font14greyRegular(),
                  ),
                ],
              ),
            ),
            horizontalSpace(10),
            Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: ColorPalette.offWhite,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: ColorPalette.borderGrey),
              ),
              child: Icon(
                Icons.sports_soccer_sharp,
                color: ColorPalette.darkBlue,
                size: 22.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
