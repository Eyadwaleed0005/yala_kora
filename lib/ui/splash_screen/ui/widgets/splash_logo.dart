import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 70.w,
          height: 70.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorPalette.overlayGrey,
            border: Border.all(color: ColorPalette.borderGrey, width: 1.w),
          ),
          child: Icon(
            Icons.sports_soccer,
            size: 45.sp,
            color: ColorPalette.green,
          ),
        )
        .animate()
        .fadeIn(duration: 500.ms, curve: Curves.easeOut)
        .scale(
          begin: const Offset(0.85, 0.85),
          end: const Offset(1, 1),
          duration: 650.ms,
          curve: Curves.easeOutBack,
        );
  }
}
