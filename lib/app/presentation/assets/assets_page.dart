import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/presentation/widgets/appbar/custom_app_bar.dart';
import 'package:asset_tracker/app/presentation/widgets/asset_page/asset_tile.dart';
import 'package:asset_tracker/app/providers/user_asset_view_model/user_asset_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssetsPage extends StatelessWidget {
  static const String id = AppTexts.assetPageId;

  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserAssetViewModel>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection(AppTexts.assets).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                AppTexts.initialAssetsMessage,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }
          final assets = snapshot.data!.docs;
          return ListView.builder(
            itemCount: assets.length,
            itemBuilder: (context, index) {
              final asset = assets[index];
              return AssetTile(
                asset: asset,
                onDelete: () => viewModel.deleteAsset(context, asset.id),
              );
            },
          );
        },
      ),
    );
  }
}
