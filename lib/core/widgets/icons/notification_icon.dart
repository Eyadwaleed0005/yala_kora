import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashRadius: 22.r,
      icon: Icon(
        Icons.notifications_outlined, 
        color: ColorPalette.white,
        size: 22.sp,
      ),
      tooltip: "الإشعارات",
    );
  }
}
