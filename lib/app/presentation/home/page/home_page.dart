import 'package:asset_tracker/app/core/border/my_border_radius.dart';
import 'package:asset_tracker/app/core/sizes/app_sizes.dart';
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
  late final TextEditingController _searchInputController =
      TextEditingController();
  @override
  void initState() {
    _searchInputController;
    super.initState();
  }

  @override
  void dispose() {
    _searchInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
      ),
    );
  }
}
