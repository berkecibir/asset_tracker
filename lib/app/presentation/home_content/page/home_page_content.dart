import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/widgets/device_padding/device_padding.dart';
import 'package:asset_tracker/app/core/widgets/device_spacing/device_spacing.dart';
import 'package:asset_tracker/app/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:asset_tracker/app/presentation/profile/page/profile_page.dart';
import 'package:asset_tracker/app/presentation/widgets/custom_button.dart';
import 'package:asset_tracker/app/presentation/home_content/mixin/home_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/constants/app_text_style.dart';
import '../../../providers/home_content_view_model/home_content_view_model.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/home_content/build_assets_list.dart';
import '../../widgets/home_content/search_field.dart';

class HomePageContent extends StatefulWidget {
  static String id = AppTexts.homePageContentId;
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> with HomeHelper {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) {
        return;
      }
      final viewModel =
          Provider.of<HomeContentViewModel>(context, listen: false);
      viewModel.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeContentViewModel>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const CustomAppBar(),
          body: Column(children: [
            DeviceSpacing.large.height,
            Padding(
              padding: DevicePadding.large.onlyHorizontal,
              child: SearchField(
                viewModel: viewModel,
              ),
            ),
            DeviceSpacing.large.height,
            Expanded(
                child: viewModel.assets.isEmpty
                    ? const Center(
                        child: Text(
                          AppTexts.noDataMessage,
                          style: kHomePageContentCenterMessage,
                        ),
                      )
                    : Padding(
                        padding: DevicePadding.small.onlyHorizontal,
                        child: BuildAssetsList(
                          viewModel: viewModel,
                        )))
          ])),
    );
  }
}
