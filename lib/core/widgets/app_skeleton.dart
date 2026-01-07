import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';

class AppSkeletonBox extends StatelessWidget {
  const AppSkeletonBox({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.radius = 12,
    this.color,
    this.shape = BoxShape.rectangle,
  });

  final double height;
  final double width;
  final double radius;
  final Color? color;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    final baseColor = color ?? ColorPalette.lightGrey.withOpacity(0.6);

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: baseColor,
        shape: shape,
        borderRadius:
            shape == BoxShape.circle ? null : BorderRadius.circular(radius.r),
      ),
    );
  }
}
