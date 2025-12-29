import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class StadiumDescription extends StatefulWidget {
  const StadiumDescription({
    super.key,
    required this.description,
    this.maxLines = 3,
    this.title = 'عن الملعب',
  });

  final String description;
  final int maxLines;
  final String title;

  @override
  State<StadiumDescription> createState() => _StadiumDescriptionState();
}

class _StadiumDescriptionState extends State<StadiumDescription> {
  bool _expanded = false;

  bool get _hasText => widget.description.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    if (!_hasText) return const SizedBox.shrink();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 14.r,
              spreadRadius: 1.r,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6.r,
              spreadRadius: -1.r,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Textstyles.font16DarkBlueMedium(),
            ),
            verticalSpace(8),

            Text(
              widget.description,
              maxLines: _expanded ? null : widget.maxLines,
              overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
              style: Textstyles.font14GreyMedium(),
            ),

            verticalSpace(10),

            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => setState(() => _expanded = !_expanded),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _expanded ? 'عرض أقل' : 'عرض المزيد',
                    style: Textstyles.font14GreyMedium().copyWith(
                      color: ColorPalette.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  horizontalSpace(4),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: ColorPalette.green,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
