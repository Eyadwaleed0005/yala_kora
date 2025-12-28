import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/style/textstyles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
    required this.onTap,
    this.questionText,
    this.actionText,
    this.alignment = Alignment.center,
    this.padding,
  });

  final VoidCallback onTap;
  final String? questionText;
  final String? actionText;
  final Alignment alignment;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(vertical: 4.h),
        child: RichText(
          text: TextSpan(
            style: Textstyles.font12DarkBlueRegular(),
            children: [
              TextSpan(text: questionText ?? 'عندك حساب بالفعل؟ '),
              TextSpan(
                text: actionText ?? 'تسجيل الدخول',
                style: Textstyles.font12GreenBold(),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
