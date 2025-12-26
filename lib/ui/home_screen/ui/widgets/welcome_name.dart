import 'package:flutter/material.dart';
import 'package:yalakora/core/style/textstyles.dart';

class WelcomeName extends StatelessWidget {
  const WelcomeName({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "مرحباً",
          style: Textstyles.font14whiteRegular().copyWith(
            height: 1.4, 
          ),
        ),
        Text(
          userName,
          style: Textstyles.font17whitebold().copyWith(
            height: 1, 
          )
        ),
      ],
    );
  }
}

