import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.keyboardType,
    this.textInputAction,
    this.isPassword = false,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.width,
    this.height,
    this.contentPadding,
    this.prefixIcon,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode autovalidateMode;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final IconData? prefixIcon;
  final bool enabled;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final borderRadius = 12.r;

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextSelectionTheme(
          data: TextSelectionThemeData(
            cursorColor: ColorPalette.darkBlue,
            selectionColor: ColorPalette.darkBlue.withOpacity(0.18),
            selectionHandleColor: ColorPalette.darkBlue,
          ),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            obscureText: widget.isPassword ? _obscurePassword : false,
            enabled: widget.enabled,
            validator: widget.validator,
            autovalidateMode: widget.autovalidateMode,
            textAlign: TextAlign.right,
            cursorColor: ColorPalette.darkBlue,
            cursorWidth: 1.6.w,
            cursorRadius: Radius.circular(2.r),
            cursorHeight: 15.h,
            style: Textstyles.font14GreyRegular().copyWith(
              color: ColorPalette.darkBlue,
            ),

            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: Textstyles.font13GreyMedium(),
              floatingLabelStyle: Textstyles.font13GreyMedium().copyWith(
                color: ColorPalette.darkBlue,
                fontSize: 11.sp,
              ),

              filled: true,
              fillColor: widget.enabled
                  ? ColorPalette.white
                  : ColorPalette.offWhite,

              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      size: 20.sp,
                      color: ColorPalette.grey,
                    )
                  : null,

              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: ColorPalette.grey,
                        size: 20.sp,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    )
                  : null,

              contentPadding:
                  widget.contentPadding ??
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: Colors.red.shade400,
                  width: 1.2.w,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: Colors.red.shade400,
                  width: 1.3.w,
                ),
              ),
              errorStyle: Textstyles.font12redRegularTajawal().copyWith(
                fontSize: 10.sp,
              ),
              errorMaxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
