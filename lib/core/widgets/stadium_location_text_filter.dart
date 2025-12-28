import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class StadiumLocationTextFilter extends StatelessWidget {
  const StadiumLocationTextFilter({
    super.key,
    required this.governorateController,
    required this.cityController,
    required this.onGovernorateChanged,
    required this.onCityChanged,
    required this.onClear,
  });

  final TextEditingController governorateController;
  final TextEditingController cityController;

  final ValueChanged<String> onGovernorateChanged;
  final ValueChanged<String> onCityChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final borderRadius = 12.r;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Expanded(
            child: _MiniField(
              controller: governorateController,
              hint: 'المحافظة',
              onChanged: onGovernorateChanged,
              borderRadius: borderRadius,
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: _MiniField(
              controller: cityController,
              hint: 'المدينة / المركز',
              onChanged: onCityChanged,
              borderRadius: borderRadius,
            ),
          ),
          horizontalSpace(10),
          InkWell(
            onTap: onClear,
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              height: 46.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: ColorPalette.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: ColorPalette.borderGrey,
                  width: 1.2.w,
                ),
              ),
              child: Icon(
                Icons.filter_alt_off_rounded,
                size: 20.sp,
                color: ColorPalette.darkBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniField extends StatelessWidget {
  const _MiniField({
    required this.controller,
    required this.hint,
    required this.onChanged,
    required this.borderRadius,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextSelectionTheme(
      data: TextSelectionThemeData(
        cursorColor: ColorPalette.darkBlue,
        selectionColor: ColorPalette.darkBlue.withOpacity(0.18),
        selectionHandleColor: ColorPalette.darkBlue,
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.right,
        style: Textstyles.font13GreyMedium().copyWith(
          color: ColorPalette.darkBlue,
        ),
        cursorColor: ColorPalette.darkBlue,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Textstyles.font13GreyMedium(),
          filled: true,
          fillColor: ColorPalette.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 12.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: ColorPalette.borderGrey,
              width: 1.2.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: ColorPalette.darkBlue, width: 1.3.w),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
