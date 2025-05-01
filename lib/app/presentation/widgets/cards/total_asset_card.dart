import 'package:asset_tracker/app/core/border/my_border_radius.dart';
import 'package:asset_tracker/app/core/sizes/app_sizes.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/utils/formatters/currency_formatter.dart';
import 'package:asset_tracker/app/core/widgets/device_padding/device_padding.dart';
import 'package:asset_tracker/app/core/widgets/device_spacing/device_spacing.dart';
import 'package:asset_tracker/app/providers/user_asset_view_model/user_asset_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalAssetCard extends StatelessWidget {
  const TotalAssetCard({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserAssetViewModel>(context);
    final total = viewModel.getTotalValue();
    final formattedTotal = CurrencyFormatter.format(total);
    return Card(
      margin: DevicePadding.large.all,
      shape: RoundedRectangleBorder(
        borderRadius: MyBorderRadius.all(AppSizes.small),
      ),
      child: Padding(
        padding: DevicePadding.small.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppTexts.totalAsset,
              style: TextStyle(
                fontSize: AppSizes.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            DeviceSpacing.medium.height,
            Text(
              formattedTotal,
              style: const TextStyle(
                fontSize: AppSizes.xLarge,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
