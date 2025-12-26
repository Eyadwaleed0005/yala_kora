import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';

class SplashAppName extends StatelessWidget {
  const SplashAppName({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Textstyles.font30darkBlueSemiBold(),
        children: [
          const TextSpan(text: 'Yala '),
          TextSpan(
            text: 'Kora',
            style: TextStyle(color: ColorPalette.green),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: 250.ms, duration: 550.ms)
        .slideY(
          begin: 0.25,
          end: 0,
          delay: 250.ms,
          duration: 650.ms,
          curve: Curves.easeOut,
        );
  }
}
