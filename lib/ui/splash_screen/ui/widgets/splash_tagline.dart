import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:yalakora/core/style/textstyles.dart';

class SplashTagline extends StatelessWidget {
  const SplashTagline({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
          'احجز ملاعب قريبة • اشتري مستلزمات كرة القدم',
          textAlign: TextAlign.center,
          style: Textstyles.font13GreyMedium(),
        )
        .animate()
        .fadeIn(delay: 520.ms, duration: 600.ms)
        .slideY(begin: 0.2, end: 0, delay: 520.ms, duration: 600.ms);
  }
}
