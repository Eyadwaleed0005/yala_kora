import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/widgets/app_skeleton.dart';
import 'package:yalakora/ui/profile_screen/ui/widget/image_profile_widgets/image_profile_skeleton.dart';

class ProfileScreenSkeleton extends StatelessWidget {
  const ProfileScreenSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorPalette.green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Center(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ImageProfileSkeleton(radius: 55.r),
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                AppSkeletonBox(height: 52.h, radius: 12.r),
                verticalSpace(12),
                AppSkeletonBox(height: 52.h, radius: 12.r),
                verticalSpace(12),
                AppSkeletonBox(height: 52.h, radius: 12.r),
                verticalSpace(12),
                AppSkeletonBox(height: 65.h, radius: 12.r),
                verticalSpace(80),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
          child: AppSkeletonBox(height: 50.h, radius: 14.r),
        ),
      ],
    );
  }
}
