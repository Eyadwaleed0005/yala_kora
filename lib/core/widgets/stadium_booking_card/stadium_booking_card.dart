import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class StadiumBookingCard extends StatelessWidget {
  const StadiumBookingCard({
    super.key,
    required this.stadiumName,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.onTap,
    this.buttonText = "احجز الآن",
  });

  final String stadiumName;
  final String location;
  final String imageUrl;
  final double rating;
  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorPalette.borderGrey),
          boxShadow: [
            BoxShadow(
              color: ColorPalette.overlayGrey,
              blurRadius: 16.r,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _StadiumCover(imageUrl: imageUrl),
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            stadiumName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Textstyles.font16DarkBlueSemiBold(),
                          ),
                        ),
                        horizontalSpace(6),
                        _RatingStars(rating: rating),
                      ],
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 15.sp,
                          color: ColorPalette.grey,
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Text(
                            location,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Textstyles.font13GreyMedium(),
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 38.h,
                        child: ElevatedButton(
                          onPressed: onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPalette.darkBlue,
                            foregroundColor: ColorPalette.white,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            buttonText,
                            style: Textstyles.font14whiteRegular(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StadiumCover extends StatelessWidget {
  const _StadiumCover({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: double.infinity,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: ColorPalette.offWhite,
          child: Center(
            child: Icon(
              Icons.sports_soccer,
              size: 32.sp,
              color: ColorPalette.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class _RatingStars extends StatelessWidget {
  const _RatingStars({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final clamped = rating.clamp(0.0, 5.0);
    final fullStars = clamped.floor();
    final hasHalf = (clamped - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 5; i++)
          Padding(
            padding: EdgeInsets.only(left: 1.w),
            child: Icon(
              i < fullStars
                  ? Icons.star
                  : (i == fullStars && hasHalf)
                      ? Icons.star_half
                      : Icons.star_border,
              size: 13.sp, 
              color: ColorPalette.orange,
            ),
          ),
        horizontalSpace(4),
        Text(
          clamped.toStringAsFixed(1),
          style: Textstyles.font12greyRegular(),
        ),
      ],
    );
  }
}
