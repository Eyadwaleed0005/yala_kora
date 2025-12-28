import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final borderRadius = 12.r;

    return SizedBox(
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextSelectionTheme(
          data: TextSelectionThemeData(
            cursorColor: ColorPalette.darkBlue,
            selectionColor: ColorPalette.darkBlue.withOpacity(0.18),
            selectionHandleColor: ColorPalette.darkBlue,
          ),
          child: TextFormField(
            controller: controller,
            enabled: enabled,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            textAlign: TextAlign.right,
            cursorColor: ColorPalette.darkBlue,
            cursorWidth: 1.6.w,
            cursorRadius: Radius.circular(2.r),
            cursorHeight: 15.h,
            style: Textstyles.font14GreyRegular().copyWith(
              color: ColorPalette.darkBlue,
            ),
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: 'ابحث عن الملعب المناسب',
              labelStyle: Textstyles.font13GreyMedium(),
              floatingLabelStyle: Textstyles.font13GreyMedium().copyWith(
                color: ColorPalette.darkBlue,
                fontSize: 11.sp,
              ),
              filled: true,
              fillColor: enabled ? ColorPalette.white : ColorPalette.offWhite,

              // ✅ أيقونة البحث
              prefixIcon: Icon(
                Icons.search_rounded,
                size: 20.sp,
                color: ColorPalette.grey,
              ),

              // ✅ زر مسح النص لو فيه كتابة
              suffixIcon: controller.text.isEmpty
                  ? null
                  : IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 18.sp,
                        color: ColorPalette.grey,
                      ),
                      onPressed: () {
                        controller.clear();
                        onChanged?.call('');
                      },
                    ),

              contentPadding:
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: ColorPalette.borderGrey,
                  width: 1.2.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: ColorPalette.darkBlue,
                  width: 1.3.w,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: ColorPalette.borderGrey,
                  width: 1.2.w,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
