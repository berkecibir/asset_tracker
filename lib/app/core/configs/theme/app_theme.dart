import 'package:asset_tracker/app/core/sizes/app_border_radius.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
        borderRadius: AppBorderRadius.small,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
        borderRadius: AppBorderRadius.small,
      ),
    ),
  );
}
