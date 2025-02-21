import 'package:asset_tracker/app/core/enum/asset_type_enum.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserAsset {
  final String id;
  final AssetType assetType;
  final int quantity;
  final String purchaseDate;

  UserAsset({
    required this.id,
    required this.assetType,
    required this.quantity,
    required this.purchaseDate,
  });

  factory UserAsset.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return UserAsset(
      id: doc.id,
      assetType: AssetType.values.firstWhere(
        (e) =>
            e.toString() ==
            '${AppTexts.assetTypeUserAsset}${data[AppTexts.assetType]}',
        orElse: () => AssetType.unknown,
      ),
      quantity: data[AppTexts.quantityAddAsset] ?? 0,
      purchaseDate: data[AppTexts.purchaseDateAddAsset] ?? AppTexts.noDateInfo,
    );
  }
}
