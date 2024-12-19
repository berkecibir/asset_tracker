import 'package:asset_tracker/app/core/sizes/app_border_radius.dart';
import 'package:asset_tracker/app/core/widgets/device_size/device_size.dart';
import 'package:flutter/material.dart';
import '../../core/utils/constants/app_text_style.dart';

class LogInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  final double _buttonheight = 60;
  final double _buttonWidth = 0.886;

  const LogInButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        fixedSize: Size(DeviceSize.width! * _buttonWidth, _buttonheight),
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.small,
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: kButtonTextStyle),
    );
  }
}
