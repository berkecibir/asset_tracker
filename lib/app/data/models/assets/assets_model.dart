import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import '../../../core/enum/asset_type_enum.dart';

class AssetsModel {
  final String name;
  final double price;
  final AssetType assetType;

  const AssetsModel({
    required this.name,
    required this.price,
    required this.assetType,
  });

  String get displayName => assetType.displayName;

  factory AssetsModel.fromJson(Map<String, dynamic> json) {
    final name = json[AppTexts.code] as String? ?? AppTexts.unKnown;
    return AssetsModel(
      name: name,
      price: _parseToDouble(json[AppTexts.sale]),
      assetType: AssetType.values.firstWhere(
        (type) => type.code == name,
        orElse: () => AssetType.unknown,
      ),
    );
  }

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
}
