import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';

class StadiumBookingCardSkeleton extends StatelessWidget {
  const StadiumBookingCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorPalette.borderGrey),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110.h,
                width: double.infinity,
                color: ColorPalette.lightGrey.withOpacity(0.6),
              ),
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _SkeletonBox(height: 16.h, width: double.infinity),
                        ),
                        SizedBox(width: 6.w),
                        _SkeletonBox(height: 14.h, width: 60.w, radius: 999),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    _SkeletonBox(height: 14.h, width: 200.w),
                    SizedBox(height: 14.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _SkeletonBox(
                        height: 38.h,
                        width: 110.w,
                        radius: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkeletonBox extends StatelessWidget {
  const _SkeletonBox({
    required this.height,
    required this.width,
    this.radius = 8,
  });

  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: ColorPalette.lightGrey.withOpacity(0.6),
        borderRadius: BorderRadius.circular(radius.r),
      ),
    );
  }
}
