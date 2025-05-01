import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/widgets/device_padding/device_padding.dart';
import 'package:asset_tracker/app/data/models/assets/user_asset.dart';
import 'package:asset_tracker/app/providers/user_asset_view_model/user_asset_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserAssetViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text(AppTexts.transactionHistoryAppBar)),
      body: StreamBuilder<List<UserAsset>>(
        stream: viewModel.assetsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text(AppTexts.transactionBodyMessage));
          }

          final transactions = snapshot.data!;

          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final asset = transactions[index];
              return Card(
                margin: DevicePadding.large.all,
                child: ListTile(
                  title: Text(asset.assetType.name.toUpperCase()),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${AppTexts.quantity}: ${asset.quantity}"),
                      Text(
                          "${AppTexts.labelTextForAddAsset}: ₺${asset.purchasePrice ?? '—'}"),
                      Text(
                          "${AppTexts.date}: ${asset.purchaseDate?.toString().substring(0, 10) ?? '—'}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
