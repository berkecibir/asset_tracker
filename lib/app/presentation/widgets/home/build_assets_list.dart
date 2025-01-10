import 'package:flutter/material.dart';

import '../../../core/utils/constants/app_texts.dart';
import '../../../providers/home_view_model/home_view_model.dart';

class BuildAssetsList extends StatelessWidget {
  const BuildAssetsList({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.assets.length,
      itemBuilder: (context, index) {
        final gold = viewModel.assets[index];
        return ListTile(
          leading: const Icon(Icons.currency_exchange),
          title: Text(gold.name),
          subtitle: Text('${gold.price} ${AppTexts.priceAsTL}'),
        );
      },
    );
  }
}
