import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/fontweighthelper.dart';

class Textstyles {
  static const String tajawal = 'Tajawal';
  static TextStyle font12whitebold() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.bold,
      fontFamily: tajawal,
      color: ColorPalette.white,
    );
  }

  static TextStyle font17whitebold() {
    return TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeightHelper.bold,
      fontFamily: tajawal,
      color: ColorPalette.white,
    );
  }

  static TextStyle font30darkBlueSemiBold() {
    return TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: tajawal,
      color: ColorPalette.darkBlue,
      height: 1.1,
    );
  }

  static TextStyle font13GreyMedium() {
    return TextStyle(
      fontFamily: tajawal,
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorPalette.grey,
    );
  }

  static TextStyle font16DarkBlueSemiBold() {
    return TextStyle(
      fontFamily: tajawal,
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: ColorPalette.darkBlue,
    );
  }



  static TextStyle font24darkBlueBold() {
    return TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold,
      fontFamily: tajawal,
      color: ColorPalette.darkBlue,
      height: 1.2,
    );
  }

  static TextStyle font14greyRegular() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      fontFamily: tajawal,
      color: ColorPalette.grey,
      height: 1.6,
    );
  }
  static TextStyle font12greyRegular() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.regular,
      fontFamily: tajawal,
      color: ColorPalette.grey,
      height: 1.6,
    );
  }

  static TextStyle font15whiteSemiBold() {
    return TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: tajawal,
      color: ColorPalette.white,
    );
  }



  static TextStyle font14darkBlueRegular() {
    return TextStyle(
      fontSize: 14.sp,
      fontFamily: tajawal,
      fontWeight: FontWeightHelper.regular,
      color: ColorPalette.darkBlue,
    );
  }

  static TextStyle font12redRegularTajawal() {
    return TextStyle(
      fontSize: 12.sp,
      fontFamily: tajawal,
      fontWeight: FontWeightHelper.regular,
      color: Colors.red.shade400,
    );
  }

  static TextStyle font12blackregular() {
    return TextStyle(
      fontSize: 12.sp,
      fontFamily: tajawal,
      fontWeight: FontWeightHelper.regular,
      color: ColorPalette.darkBlue,
    );
  }

  static TextStyle font12greenBold() {
    return TextStyle(
      fontSize: 12.sp,
      fontFamily: tajawal,
      fontWeight: FontWeightHelper.bold,
      color: ColorPalette.green,
    );
  }

  static TextStyle font22darkBlueExtraBold() {
    return TextStyle(
      fontSize: 22.sp,
      fontFamily: tajawal,
      fontWeight: FontWeightHelper.extraBold,
      color: ColorPalette.darkBlue,
      height: 1.2,
    );
  }

  static TextStyle font14whiteRegular() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      fontFamily: tajawal,
      color: ColorPalette.white,
    );
  }
}
