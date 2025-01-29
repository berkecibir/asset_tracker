import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:flutter/material.dart';

import '../../../core/enum/asset_type_enum.dart';

class AssetsModel {
  final String name;
  final double price;
  // final AssetType assetType;

  const AssetsModel({
    required this.name,
    required this.price,
    /* required this.assetType */
  });
  String get displayName => name;
  factory AssetsModel.fromJson(Map<String, dynamic> json) {
    debugPrint('${AppTexts.jsonData} $json');
    return AssetsModel(
      name: json[AppTexts.code] ?? AppTexts.unKnown,
      price: _parseToDouble(json[AppTexts.sale]),
    );
  }
  /*  factory AssetsModel.fromJson(Map<String, dynamic> json) {
    return AssetsModel(
      name: json[AppTexts.code] ?? AppTexts.unKnown,
      price: _parseToDouble(json[AppTexts.sale]),
      assetType: AssetType.values.firstWhere(
        (e) => e.toString() == 'AssetType.${json['assetType']}',
        orElse: () => AssetType.altin, // Default value if assetType is missing
      ),
    );
  } */

  static double _parseToDouble(dynamic json) {
    if (json == null) {
      return 0.0;
    }
    if (json is num) {
      return json.toDouble();
    }
    if (json is String) {
      final parsedValue = double.tryParse(json);
      if (parsedValue != null) {
        return parsedValue;
      }
    }
    return 0.0;
  }

  toLowerCase() {}
}
