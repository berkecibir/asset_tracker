import 'package:asset_tracker/app/core/enum/asset_type_enum.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';

class AddAssetModel {
  final AssetType assetType;
  final int quantity;
  final double purchasePrice;
  final DateTime purchaseDate;

  const AddAssetModel({
    required this.assetType,
    required this.quantity,
    required this.purchasePrice,
    required this.purchaseDate,
  });

  factory AddAssetModel.fromJson(Map<String, dynamic> json) {
    return AddAssetModel(
      assetType: AssetType.values
          .firstWhere((e) => e.toString() == json[AppTexts.assetType]),
      quantity: json[AppTexts.quantityAddAsset],
      purchasePrice: json[AppTexts.purchasePrice],
      purchaseDate: DateTime.parse(json[AppTexts.purchaseDateAddAsset]),
    );
  }
}
