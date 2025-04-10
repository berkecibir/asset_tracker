import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/providers/add_asset_view_model/add_asset_view_model.dart';
import 'package:flutter/material.dart';

class QuantityText extends StatelessWidget {
  const QuantityText({
    super.key,
    required this.viewModel,
  });

  final AddAssetViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${AppTexts.quantity}: ${viewModel.quantity}",
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
