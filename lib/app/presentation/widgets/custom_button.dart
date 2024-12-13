import 'package:flutter/material.dart';
import 'package:asset_tracker/app/core/sizes/app_border_radius.dart';
import 'package:asset_tracker/app/core/widgets/device_size/device_size.dart';
import '../../core/utils/constants/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppBorderRadius.small,
      child: Container(
        width: DeviceSize.width! * 0.886,
        height: 60,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: AppBorderRadius.small,
        ),
        child: Text(
          title,
          style: kButtonTextStyle,
        ),
      ),
    );
  }
}
