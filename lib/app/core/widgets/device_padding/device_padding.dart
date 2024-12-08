import 'package:flutter/material.dart';

final class PaddingType {
  PaddingType._();
}

///Project's global padding class
enum DevicePadding {
  ///This value is 5
  xsmall(5),

  ///This value is 10
  small(10),

  ///This value is 15
  medium(15),

  ///This value is 20
  large(20),

  ///This value is 30
  xlarge(30);

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
