import 'package:flutter/material.dart';
import 'package:yalakora/core/style/textstyles.dart';

class PriceRowWidget extends StatelessWidget {
  const PriceRowWidget({
    super.key,
    required this.pricePerHour,
  });

  final num pricePerHour;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: RichText(
            text: TextSpan(
              text: pricePerHour.toString(),
              style: Textstyles.font15GreenBold(),
              children: [
                TextSpan(
                  text: ' جنيه / الساعة',
                  style: Textstyles.font15GreenBold(),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Text(
          'السعر',
          style: Textstyles.font16GreyRegular(),
        ),
      ],
    );
  }
}
