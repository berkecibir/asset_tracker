import 'package:asset_tracker/app/core/sizes/app_sizes.dart';
import 'package:flutter/material.dart';

final class PaddingType {
  PaddingType._();
}

///Project's global padding class
enum DevicePadding {
  ///This value is 5
  xsmall(AppSizes.xSmall),

  ///This value is 10
  small(AppSizes.small),

  ///This value is 15
  medium(AppSizes.medium),

  ///This value is 20
  large(AppSizes.large),

  ///This value is 30
  xlarge(AppSizes.xLarge);

  final double value;
  const DevicePadding(this.value);

  EdgeInsets get all => EdgeInsets.all(
        value,
      );

  EdgeInsets get onlyBottom => EdgeInsets.only(
        bottom: value,
      );

  EdgeInsets get onlyRight => EdgeInsets.only(
        right: value,
      );

  EdgeInsets get onlyHorizontal => EdgeInsets.symmetric(
        horizontal: value,
      );

  EdgeInsets get onlyVertical => EdgeInsets.symmetric(
        vertical: value,
      );
}
