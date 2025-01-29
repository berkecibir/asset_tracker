import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:asset_tracker/app/presentation/login/page/login_page.dart';
import 'package:asset_tracker/app/providers/auth_view_model/auth_view_model.dart';
import 'package:asset_tracker/app/providers/profile_view_model/profile_view_model.dart';
import 'package:flutter/material.dart';

class ProifleListWidgets extends StatelessWidget {
  const ProifleListWidgets({
    super.key,
    required this.profileViewModel,
    required this.authViewModel,
  });

  final ProfileViewModel profileViewModel;
  final AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.grey);
      },
      itemCount: profileViewModel.items.length,
      itemBuilder: (context, index) {
        final item = profileViewModel.items[index];
        return ListTile(
          leading: Icon(item[AppTexts.icon]),
          title: Text(item[AppTexts.title]),
          onTap: () {
            if (item[AppTexts.title] == AppTexts.logOut) {
              Navigation.pushReplace(page: const LoginPage());
              authViewModel.signOut();
            }
          },
        );
      },
    );
  }
}
