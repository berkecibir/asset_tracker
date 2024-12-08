import 'package:flutter/material.dart';

final class DeviceSize {
  static MediaQueryData? _data;
  static double? width;
  static double? height;

  /// Ekran boyutlarını initialize eder.
  static void init(BuildContext context) {
    _data = MediaQuery.of(context);
    width = _data?.size.width;
    height = _data?.size.height;
  }

  /// Yüzdeye göre genişlik hesaplama
  static double calculateWidth(double percentage) {
    return (width ?? 0) * (percentage / 100);
  }

  /// Yüzdeye göre yükseklik hesaplama
  static double calculateHeight(double percentage) {
    return (height ?? 0) * (percentage / 100);
  }
}
