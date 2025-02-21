import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/providers/add_asset_view_model/add_asset_view_model.dart';
import 'package:flutter/material.dart';

class PurchaseDateButton extends StatelessWidget {
  const PurchaseDateButton({
    super.key,
    required this.viewModel,
  });

  final AddAssetViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => viewModel.selectDate(context),
      child: Text(
        viewModel.purchaseDate == null
            ? AppTexts.choosePurchaseDate
            : "${AppTexts.choosenAsset} ${viewModel.purchaseDate!.toLocal()}"
                .split(' ')[1],
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
