import 'package:asset_tracker/app/core/enum/asset_type_enum.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserAsset {
  final String id;
  final AssetType assetType;
  final int quantity;
  final String? purchasePrice;
  final String? purchaseDate;

  UserAsset({
    required this.id,
    required this.assetType,
    required this.quantity,
    this.purchasePrice,
    this.purchaseDate,
  });

  factory UserAsset.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    debugPrint("Firestore assetType: ${data[AppTexts.assetType]}");
    return UserAsset(
      id: doc.id,
      assetType: AssetType.values.firstWhere(
        (e) => e.code == data[AppTexts.assetType],
        orElse: () => AssetType.unknown,
      ),
      quantity: data[AppTexts.quantityAddAsset] ?? 0,
      purchasePrice: data[AppTexts.purchasePrice]?.toString(),
      purchaseDate: data[AppTexts.purchaseDateAddAsset],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      AppTexts.assetType: assetType.code,
      AppTexts.quantityAddAsset: quantity,
      AppTexts.purchasePrice: purchasePrice,
      AppTexts.purchaseDateAddAsset: purchaseDate,
    };
  }
}


/* class UserAsset {
  final String id;
  final String assetType;
  final int quantity;
  final String? purchasePrice;
  final String? purchaseDate;

  UserAsset({
    required this.id,
    required this.assetType,
    required this.quantity,
    this.purchasePrice,
    this.purchaseDate,
  });

  factory UserAsset.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    debugPrint("Firestore assetType: ${data[AppTexts.assetType]}");

    return UserAsset(
      id: doc.id,
      assetType: data[AppTexts.assetType] ?? AppTexts.userAssetModelUnknown,
      quantity: data[AppTexts.quantityAddAsset] ?? 0,
      purchasePrice: data[AppTexts.purchasePrice].toString(),
      purchaseDate: data[AppTexts.purchaseDateAddAsset],
    );
  }
}
 */