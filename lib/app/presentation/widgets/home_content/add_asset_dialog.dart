import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/widgets/device_spacing/device_spacing.dart';
import 'package:asset_tracker/app/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:asset_tracker/app/presentation/widgets/home_content/alert_dialog_action_button.dart';
import 'package:asset_tracker/app/presentation/widgets/home_content/asset_type_drop_down.dart';
import 'package:asset_tracker/app/presentation/widgets/home_content/price_input_field.dart';
import 'package:asset_tracker/app/presentation/widgets/home_content/purchase_date_button.dart';
import 'package:asset_tracker/app/presentation/widgets/home_content/quantity_button.dart';
import 'package:asset_tracker/app/presentation/widgets/home_content/quantity_text.dart';
import 'package:asset_tracker/app/providers/add_asset_view_model/add_asset_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAssetDialog extends StatelessWidget {
  const AddAssetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddAssetViewModel>(context);

    return AlertDialog(
      title: const Text(AppTexts.addAsset),
      content: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AssetTypeDropdown(viewModel: viewModel),
            DeviceSpacing.small.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuantityButton.decrement(
                  viewModel: viewModel,
                  onPressed: viewModel.decrementQuantity,
                ),
                QuantityText(viewModel: viewModel),
                QuantityButton.increment(
                  viewModel: viewModel,
                  onPressed: viewModel.incrementQuantity,
                ),
              ],
            ),
            DeviceSpacing.small.height,
            PriceInputField(viewModel: viewModel),
            DeviceSpacing.small.height,
            PurchaseDateButton(viewModel: viewModel),
            if (viewModel.showPurchaseDateError)
              const Text(
                AppTexts.enterPurchaseDate,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
          ],
        ),
      ),
      actions: [
        AlertDialogActionButton.cancel(
          viewModel: viewModel,
          onPressed: () {
            viewModel.resetForm();
            Navigation.ofPop();
          },
        ),
        AlertDialogActionButton.confirm(
          viewModel: viewModel,
          onPressed: () => viewModel.submitForm(context),
        ),
      ],
    );
  }
}
