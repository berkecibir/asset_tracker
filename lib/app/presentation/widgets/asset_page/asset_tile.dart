import 'package:asset_tracker/app/core/enum/asset_type_enum.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/data/models/assets/user_asset.dart';
import 'package:flutter/material.dart';

class AssetTile extends StatelessWidget {
  final UserAsset asset;
  final VoidCallback onDelete;

  const AssetTile({
    required this.asset,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          asset.assetType.displayName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${AppTexts.quantity}: ${asset.quantity}'),
            Text('${AppTexts.price}: ${asset.purchasePrice}'),
            Text('${AppTexts.purchaseDate}: ${asset.purchaseDate}'),
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
