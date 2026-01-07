import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/widgets/app_skeleton.dart';

class ImageProfileSkeleton extends StatelessWidget {
  const ImageProfileSkeleton({
    super.key,
    this.radius = 32,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    final double size = radius * 2;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppSkeletonBox(
          height: size,
          width: size,
          shape: BoxShape.circle,
          color: ColorPalette.lightGrey.withOpacity(0.6),
        ),
        Positioned(
          bottom: -1.h,
          right: -1.w,
          child: Container(
            height: 25.h,
            width: 25.w,
            decoration: BoxDecoration(
              color: ColorPalette.offWhite,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AppSkeletonBox(
                height: 14.h,
                width: 14.h,
                shape: BoxShape.circle,
                color: ColorPalette.lightGrey.withOpacity(0.6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
