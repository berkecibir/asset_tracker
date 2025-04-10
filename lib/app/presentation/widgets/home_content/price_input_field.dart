import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/utils/validators/add_asset_validator.dart';
import 'package:asset_tracker/app/providers/add_asset_view_model/add_asset_view_model.dart';
import 'package:flutter/material.dart';

class PriceInputField extends StatelessWidget {
  const PriceInputField({
    super.key,
    required this.viewModel,
  });

  final AddAssetViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: AppTexts.labelTextForAddAsset,
      ),
      onChanged: (value) => viewModel.purchasePrice = double.tryParse(value),
      validator: (value) => AssetValidator.validateEnterPriceInfo(value),
    );
  }
}
