import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:flutter/material.dart';

class AuthGreetText extends StatelessWidget {
  const AuthGreetText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          AppTexts.loginPageGreet,
          textStyle: Theme.of(context).textTheme.headlineLarge,
          speed: const Duration(milliseconds: 100),
        ),
      ],
      repeatForever: false,
      totalRepeatCount: 2,
    );
  }
}
