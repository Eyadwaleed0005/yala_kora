import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';

class ImageProfile extends StatelessWidget {
  final String? imageUrl;
  final String defaultAssetPath;
  final double radius;
  final VoidCallback? onEditTap;

  const ImageProfile({
    super.key,
    required this.imageUrl,
    required this.defaultAssetPath,
    this.radius = 32,
    this.onEditTap,
  });

  bool get _hasNetworkImage =>
      imageUrl != null && imageUrl!.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: _hasNetworkImage
              ? NetworkImage(imageUrl!.trim())
              : AssetImage(defaultAssetPath) as ImageProvider,
        ),
        Positioned(
          bottom: -1.h,
          right: -1.w,
          child: GestureDetector(
            onTap: onEditTap,
            child: Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                color: ColorPalette.offWhite,
                shape: BoxShape.circle,
              ),
              child:  Icon(
                Icons.camera_alt_rounded,
                size: 16.sp,
                color: ColorPalette.darkBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
