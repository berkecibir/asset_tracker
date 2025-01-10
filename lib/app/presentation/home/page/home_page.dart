import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/presentation/widgets/custom_button.dart';
import 'package:asset_tracker/app/presentation/widgets/home/home_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/home_view_model/home_view_model.dart';
import '../../widgets/home/build_assets_list.dart';

class HomePage extends StatefulWidget {
  static String id = AppTexts.homePageId;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeHelper {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTexts.homePageTitle),
      ),
      body: Column(
        children: [
          Visibility(
            visible: viewModel.assets.isEmpty,
            child: CustomButton(
              onTap: () {
                viewModel.fetchData();
              },
              title: AppTexts.fetchDataButton,
            ),
          ),
          Expanded(
            child: viewModel.assets.isEmpty
                ? const Center(
                    child: Text(AppTexts.noDataMessage),
                  )
                : BuildAssetsList(viewModel: viewModel),
          ),
        ],
      ),
    );
  }
}
