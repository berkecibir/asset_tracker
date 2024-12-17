import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:asset_tracker/app/presentation/home/page/home_page.dart';
import '../../../core/widgets/navigation_helper/navigation_helper.dart';
import '../../../providers/auth_view_model/auth_view_model.dart';

Future<void> handleSignUp({
  required AuthViewModel authViewModel,
  required GlobalKey<FormState> formKey,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required BuildContext context,
}) async {
  if (validatorForm(formKey)) {
    try {
      await authViewModel.signUp(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (context.mounted) {
        navigateToHome(context);
      }
    } catch (e) {
      if (context.mounted) {
        showErrorSnackBar(context, '${AppTexts.errorOccurredLogin} $e');
      }
    }
  } else {
    debugPrint('Form İşlemleri tamamlanamadı');
  }
}

bool validatorForm(GlobalKey<FormState> key) {
  return key.currentState?.validate() ?? false;
}

void navigateToHome(BuildContext context) {
  Navigation.pushReplace(page: const HomePage());
}

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
