import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';
import 'package:yalakora/core/widgets/section_title.dart';

class ExtraSlotsHeader extends StatelessWidget {
  const ExtraSlotsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.info_outline,
          size: 16.sp,
          color: ColorPalette.grey,
        ),
        horizontalSpace(6),
        SectionTitle(
          title: "مواعيد إضافية",
          textStyle: Textstyles.font15GreySemiBold(),
        ),
      ],
    );
  }
}
