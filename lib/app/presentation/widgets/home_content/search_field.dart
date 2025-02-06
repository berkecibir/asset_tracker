import 'package:asset_tracker/app/core/border/my_border_radius.dart';
import 'package:asset_tracker/app/core/sizes/app_sizes.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:flutter/material.dart';

import '../../../providers/home_content_view_model/home_content_view_model.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.viewModel,
  });

  final HomeContentViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: viewModel.editingController,
      onChanged: (value) {
        viewModel.filterQuery = value;
      },
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: AppTexts.searchingAssets,
        suffixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: MyBorderRadius.all(AppSizes.medium),
        ),
      ),
    );
  }
}
