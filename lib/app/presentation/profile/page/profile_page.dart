import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/widgets/device_padding/device_padding.dart';
import 'package:asset_tracker/app/core/widgets/device_spacing/device_spacing.dart';
import 'package:asset_tracker/app/presentation/profile/mixin/profile_mixin.dart';
import 'package:asset_tracker/app/presentation/widgets/appbar/custom_app_bar.dart';
import 'package:asset_tracker/app/presentation/widgets/profile/user_info.dart';
import 'package:flutter/material.dart';
import '../../widgets/profile/profile_list_widget.dart';

class ProfilePage extends StatefulWidget {
  static String id = AppTexts.profilePageId;

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfileMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: DevicePadding.medium.onlyHorizontal,
              child: UserInfo(profileViewModel: profileViewModel),
            ),
            DeviceSpacing.small.height,
            const Divider(color: Colors.grey),
            Expanded(
                child: ProifleListWidgets(
                    profileViewModel: profileViewModel,
                    authViewModel: authViewModel)),
          ],
        ),
      ),
    );
  }
}
