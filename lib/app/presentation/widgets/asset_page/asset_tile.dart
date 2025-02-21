import 'package:asset_tracker/app/core/enum/asset_type_enum.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AssetTile extends StatelessWidget {
  final QueryDocumentSnapshot asset;
  final VoidCallback onDelete;

  const AssetTile({
    required this.asset,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final assetType = AssetType.values
        .firstWhere((e) => e.toString() == asset[AppTexts.assetType].toString())
        .code;
    final quantity = asset[AppTexts.quantityAddAsset] ?? 0;
    final purchasePrice = asset[AppTexts.purchasePrice] ?? AppTexts.noPriceInfo;
    final purchaseDate =
        asset[AppTexts.purchaseDateAddAsset] ?? AppTexts.noDateInfo;

    return Card(
      child: ListTile(
        title: Text(assetType),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${AppTexts.quantity}: $quantity'),
            Text('${AppTexts.price}: $purchasePrice'),
            Text('${AppTexts.purchaseDate} $purchaseDate'),
          ],
        ),
        leading: const Icon(Icons.shopping_bag),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
