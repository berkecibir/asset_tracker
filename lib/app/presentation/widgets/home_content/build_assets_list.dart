import 'package:asset_tracker/app/core/enum/asset_type_enum.dart';
import 'package:asset_tracker/app/core/sizes/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../providers/home_content_view_model/home_content_view_model.dart';

class BuildAssetsList extends StatelessWidget {
  const BuildAssetsList({
    super.key,
    required this.viewModel,
  });

  final HomeContentViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final itemCount = viewModel.filteredAssets.length;

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final gold = viewModel.filteredAssets[index];
        final assetType = gold.assetType;
        return ListTile(
          leading: const Icon(Icons.currency_exchange),
          title: Text(
            assetType.displayName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.assetNamesize,
            ),
          ),
          subtitle: Text(
            '${gold.price} ${AppTexts.priceAsTL}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.medium,
            ),
          ),
        );
      },
    );
  }
}
