import 'package:asset_tracker/app/core/enum/asset_type_enum.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/utils/validators/add_asset_validator.dart';
import 'package:asset_tracker/app/providers/add_asset_view_model/add_asset_view_model.dart';
import 'package:flutter/material.dart';

class AssetTypeDropdown extends StatelessWidget {
  const AssetTypeDropdown({
    super.key,
    required this.viewModel,
  });

  final AddAssetViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: viewModel.selectedAssetType,
      hint: const Text(AppTexts.hintForDropDown),
      items: AssetType.values
          .where((e) => e.displayName != AppTexts.unKnownType)
          .map(
            (e) => DropdownMenuItem(
              value: e.toString(),
              child: Text(e.displayName),
            ),
          )
          .toList(),
      onChanged: (value) => viewModel.selectedAssetType = value,
      validator: (value) => AssetValidator.validateAssetType(value),
    );
  }
}
