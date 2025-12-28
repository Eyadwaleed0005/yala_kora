import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class GreenOutlineActionButton extends StatelessWidget {
  const GreenOutlineActionButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.padding,
    this.borderRadius,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular((borderRadius ?? 12).r);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Container(
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 8.h,
              ),
          decoration: BoxDecoration(
            color:  ColorPalette.white,
            borderRadius: radius,
            border: Border.all(
              color: ColorPalette.green,
              width: 1.w,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Textstyles.font15GreenMedium(),
              ),
              horizontalSpace(3),
              Icon(
                icon,
                color: ColorPalette.green,
                size: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
