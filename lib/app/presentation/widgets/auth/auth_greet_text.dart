import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:flutter/material.dart';

class AuthGreetText extends StatelessWidget {
  final int repeatCount;
  const AuthGreetText({
    super.key,
    this.repeatCount = 2,
  });

  Duration durationValue() => const Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          AppTexts.loginPageGreet,
          textStyle: Theme.of(context).textTheme.headlineLarge,
          speed: durationValue(),
        ),
      ],
      repeatForever: false,
      totalRepeatCount: repeatCount,
    );
  }
}
