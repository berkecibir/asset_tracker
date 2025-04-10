import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/providers/add_asset_view_model/add_asset_view_model.dart';
import 'package:flutter/material.dart';

class AlertDialogActionButton extends StatelessWidget {
  final String textButtonMessage;
  final Function() onPressed;
  const AlertDialogActionButton({
    super.key,
    required this.viewModel,
    required this.onPressed,
    required this.textButtonMessage,
  });

  final AddAssetViewModel viewModel;

  factory AlertDialogActionButton.cancel({
    required AddAssetViewModel viewModel,
    required Function() onPressed,
  }) {
    return AlertDialogActionButton(
      viewModel: viewModel,
      onPressed: onPressed,
      textButtonMessage: AppTexts.cancel,
    );
  }

  factory AlertDialogActionButton.confirm({
    required AddAssetViewModel viewModel,
    required Function() onPressed,
  }) {
    return AlertDialogActionButton(
      viewModel: viewModel,
      onPressed: onPressed,
      textButtonMessage: AppTexts.addAssetButton,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        textButtonMessage,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
