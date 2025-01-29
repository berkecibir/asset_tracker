import 'package:asset_tracker/app/core/sizes/app_sizes.dart';
import 'package:asset_tracker/app/core/utils/constants/app_text_style.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/providers/profile_view_model/profile_view_model.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.profileViewModel,
  });

  final ProfileViewModel profileViewModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: AppSizes.xLarge,
        backgroundImage: NetworkImage(AppTexts.randomImage),
      ),
      title: Text(
        profileViewModel.profileModel!.userName,
        style: kProfilePageUserName,
      ),
    );
  }
}
