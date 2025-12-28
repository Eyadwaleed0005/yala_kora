import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class StadiumBasicInfoCard extends StatelessWidget {
  const StadiumBasicInfoCard({
    super.key,
    required this.stadiumName,
    required this.ownerName,
    required this.location,
    required this.address,
  });

  final String stadiumName;
  final String ownerName;
  final String location;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
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
            Text(
              stadiumName,
              style: Textstyles.font16DarkBlueMedium(),
            ),
            verticalSpace(6),
            Text(
              'المالك: $ownerName',
              style: Textstyles.font14GreyMedium(),
            ),
            verticalSpace(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: ColorPalette.green,
                  size: 20.sp,
                ),
                horizontalSpace(2),
                Text(
                  location,
                  style: Textstyles.font14DarkBlueMedium(),
                  strutStyle: StrutStyle(
                    forceStrutHeight: true,
                    height: 1.h,
                  ),
                ),
              ],
            ),
            verticalSpace(6),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 4.w,
              ),
              child: Text(
                address,
                style: Textstyles.font14GreyMedium(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
