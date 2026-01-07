import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class ProfileOptionSection extends StatelessWidget {
  const ProfileOptionSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.iconBgColor,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? iconBgColor;

  @override
  Widget build(BuildContext context) {
    final Color resolvedIconColor = iconColor ?? ColorPalette.green;
    final Color resolvedBgColor =
        iconBgColor ?? resolvedIconColor.withOpacity(0.12);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: ColorPalette.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: ColorPalette.borderGrey),
          ),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16.sp,
                color: ColorPalette.grey,
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Textstyles.font14GreyRegular().copyWith(
                        color: ColorPalette.darkBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    verticalSpace(2),
                    Text(
                      subtitle,
                      style: Textstyles.font12GreyRegular().copyWith(
                        color: ColorPalette.grey,
                      ),
                    ),
                  ],
                ),
              ),
              horizontalSpace(12),
              Container(
                height: 38.h,
                width: 38.h,
                decoration: BoxDecoration(
                  color: resolvedBgColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  icon,
                  color: resolvedIconColor,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
