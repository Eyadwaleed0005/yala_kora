import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import '../../../../core/widgets/icons/menu_icon.dart';
import '../../../../core/widgets/icons/notification_icon.dart';
import 'welcome_name.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.userName,
    this.onMenuTap,
    this.onNotificationsTap,
  });

  final String userName;
  final VoidCallback? onMenuTap;
  final VoidCallback? onNotificationsTap;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        height: 85.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: ColorPalette.green,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuIcon(onTap: onMenuTap),
              horizontalSpace(8),
              Expanded(child: WelcomeName(userName: userName)),
              NotificationIcon(onTap: onNotificationsTap),
            ],
          ),
        ),
      ),
    );
  }
}
