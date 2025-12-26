import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';
import 'package:yalakora/core/helper/spacer.dart';

class StartHero extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const StartHero({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
              width: 180.w,
              height: 180.w,
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorPalette.white,
              ),
              child: ClipOval(
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            )
            .animate()
            .fadeIn(duration: 450.ms)
            .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),

        verticalSpace(18),

        Text(
          title,
          textAlign: TextAlign.center,
          style: Textstyles.font24darkBlueBold(),
        ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.15, end: 0),

        verticalSpace(10),

        Text(
          description,
          textAlign: TextAlign.center,
          style: Textstyles.font14greyRegular(),
        ).animate().fadeIn(delay: 280.ms).slideY(begin: 0.15, end: 0),
      ],
    );
  }
}
