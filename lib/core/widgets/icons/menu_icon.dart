import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yalakora/core/style/app_color.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashRadius: 22.r,
      icon: FaIcon(
        FontAwesomeIcons.alignLeft, 
        color: ColorPalette.white,
        size: 20.sp,
      ),
      tooltip: "القائمة",
    );
  }
}
