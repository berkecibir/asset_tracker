import 'package:asset_tracker/app/providers/add_asset_view_model/add_asset_view_model.dart';
import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  const QuantityButton({
    super.key,
    required this.viewModel,
    required this.onPressed,
    required this.icon,
  });

  final AddAssetViewModel viewModel;

  factory QuantityButton.decrement({
    required AddAssetViewModel viewModel,
    required Function() onPressed,
  }) {
    return QuantityButton(
      viewModel: viewModel,
      onPressed: onPressed,
      icon: Icons.remove,
    );
  }

  factory QuantityButton.increment({
    required AddAssetViewModel viewModel,
    required Function() onPressed,
  }) {
    return QuantityButton(
      viewModel: viewModel,
      onPressed: onPressed,
      icon: Icons.add,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
