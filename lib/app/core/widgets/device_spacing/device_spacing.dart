import 'package:flutter/material.dart';

final class SpacingType {
  SpacingType._();
}

/// Proje için global SizedBox sınıfı
enum DeviceSpacing {
  /// Bu değer 5
  xsmall(5),

  /// Bu değer 10
  small(10),

  /// Bu değer 15
  medium(15),

  /// Bu değer 20
  large(20),

  /// Bu değer 30
  xlarge(30);

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
