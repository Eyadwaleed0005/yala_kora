import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/widgets/custom_back_button.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_favorite_button.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_rating_pill.dart';

class StadiumDetailsCover extends StatelessWidget {
  const StadiumDetailsCover({
    super.key,
    required this.imageUrl,
    required this.rating,
    this.height,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  final String imageUrl;
  final double rating;
  final double? height;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 160.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: ColorPalette.offWhite,
                alignment: Alignment.center,
                child: Icon(
                  Icons.sports_soccer,
                  size: 36.sp,
                  color: ColorPalette.grey,
                ),
              ),
            ),
          ),
          Positioned(
            top: 16.h,
            left: 12.w,
            right: 12.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StadiumFavoriteButton(
                  isFavorite: isFavorite,
                  onTap: onFavoriteTap,
                ),
                StadiumRatingPill(rating: rating),
                const CustomBackButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
