import 'package:flutter/material.dart';

import '../../sizes/app_sizes.dart';

final class SpacingType {
  SpacingType._();
}

/// Proje için global SizedBox sınıfı
enum DeviceSpacing {
  /// Bu değer 5
  xsmall(AppSizes.xSmall),

  /// Bu değer 10
  small(AppSizes.small),

  /// Bu değer 15
  medium(AppSizes.medium),

  /// Bu değer 20
  large(AppSizes.large),

  /// Bu değer 30
  xlarge(AppSizes.xLarge);

  final double value;
  const DeviceSpacing(this.value);

  /// Sadece genişlik için SizedBox
  SizedBox get width => SizedBox(
        width: value,
      );

  /// Sadece yükseklik için SizedBox
  SizedBox get height => SizedBox(
        height: value,
      );

  /// Hem genişlik hem yükseklik için SizedBox (kare bir boşluk)
  SizedBox get square => SizedBox(
        width: value,
        height: value,
      );
}
