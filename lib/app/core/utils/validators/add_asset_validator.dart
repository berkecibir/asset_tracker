import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';

class AssetValidator {
  static String? validateAssetType(String? assetType) {
    return (assetType == null || assetType.isEmpty)
        ? AppTexts.enterAssetTypeInfo
        : null;
  }

  static String? validateEnterPriceInfo(String? priceInfo) {
    return (priceInfo == null || priceInfo.isEmpty)
        ? AppTexts.enterPriceInfo
        : null;
  }

  static String? validatePurchaseDate(DateTime? purchaseDate) {
    return (purchaseDate == null) ? AppTexts.enterPurchaseDate : null;
  }

  static String? validateQuantity(int? quantity) {
    return (quantity == null || quantity <= 0) ? AppTexts.enterQuantity : null;
  }
}
