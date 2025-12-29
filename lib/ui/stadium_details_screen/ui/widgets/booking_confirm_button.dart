import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';
import 'package:yalakora/core/widgets/app_loading_indicator.dart';

class BookingConfirmButton extends StatelessWidget {
  const BookingConfirmButton({
    super.key,
    required this.isEnabled,
    required this.isLoading,
    required this.onPressed,
    this.title = 'تأكيد الحجز',
  });

  final bool isEnabled;
  final bool isLoading;
  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: (isEnabled && !isLoading) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isEnabled ? ColorPalette.green : ColorPalette.gray200,
          disabledBackgroundColor: ColorPalette.gray200,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 22.h,
                width: 22.h,
                child: const AppLoadingIndicator(
                  color: ColorPalette.green,
                ),
              )
            : Text(
                title,
                style: isEnabled
                    ? Textstyles.font16Whitebold()
                    : Textstyles.font16Gray400Bold(),
              ),
      ),
    );
  }
}
