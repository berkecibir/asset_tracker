import 'package:asset_tracker/app/core/utils/constants/app_text_style.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:asset_tracker/app/presentation/transaction_history/page/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        AppTexts.appBarTitle,
        style: kAppBar,
      ),
      actions: [
        IconButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          icon: const Icon(Icons.exit_to_app),
        ),
        IconButton(
          onPressed: () {
            Navigation.push(page: const TransactionHistoryPage());
          },
          icon: const Icon(Icons.history),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
