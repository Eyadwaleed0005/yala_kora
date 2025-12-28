import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorPalette.offWhite,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () => Navigator.pop(context),
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 35.w,
          height: 35.h,
          child: Icon(
            Icons.arrow_forward, 
            size: 18.sp,
            color: ColorPalette.darkBlue,
          ),
        ),
      ),
    );
  }
}
