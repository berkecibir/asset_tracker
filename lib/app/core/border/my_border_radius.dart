import 'package:asset_tracker/app/core/sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class MyBorderRadius extends BorderRadius {
  MyBorderRadius.all(double radius) : super.all(Radius.circular(radius));

  MyBorderRadius.only({
    double topLeft = AppSizes.zero,
    double topRight = AppSizes.zero,
    double bottomLeft = AppSizes.zero,
    double bottomRight = AppSizes.zero,
  }) : super.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        );

  MyBorderRadius.horizontal(double radius)
      : super.horizontal(
            left: Radius.circular(radius), right: Radius.circular(radius));

  MyBorderRadius.vertical(double radius)
      : super.vertical(
            top: Radius.circular(radius), bottom: Radius.circular(radius));

  static MyBorderRadius symmetric(
          {double vertical = AppSizes.zero,
          double horizontal = AppSizes.zero}) =>
      MyBorderRadius.only(
        topLeft: horizontal,
        topRight: horizontal,
        bottomLeft: horizontal,
        bottomRight: horizontal,
      );

  static MyBorderRadius circular(double radius) => MyBorderRadius.all(radius);
}
