import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/presentation/home/page/home_page.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/navigation_helper/navigation_helper.dart';
import '../../../providers/auth_view_model/auth_view_model.dart';
import '../../login/page/login_page.dart';

mixin LogInHelper on State<LoginPage> {
  Future<void> handleSignIn({
    required AuthViewModel authViewModel,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required BuildContext context,
  }) async {
    if (validatorForm(formKey)) {
      try {
        await authViewModel.signIn(
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

  Future<void> onSignInPressed(AuthViewModel authViewModel) async {
    final formKey = authViewModel.key;
    final emailController = authViewModel.mailController;
    final passwordController = authViewModel.passwordController;

    await handleSignIn(
      authViewModel: authViewModel,
      formKey: formKey,
      emailController: emailController,
      passwordController: passwordController,
      context: context,
    );
  }
}
