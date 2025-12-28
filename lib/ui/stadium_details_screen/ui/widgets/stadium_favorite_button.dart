import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';

class StadiumFavoriteButton extends StatelessWidget {
  const StadiumFavoriteButton({
    super.key,
    this.isFavorite = false,
    this.onTap,
  });

  final bool isFavorite;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorPalette.offWhite,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 35.w,
          height: 35.h,
          child: Icon(
            isFavorite
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            size: 18.sp,
            color:
                isFavorite ? Colors.redAccent : ColorPalette.darkBlue,
          ),
        ),
      ),
    );
  }
}
