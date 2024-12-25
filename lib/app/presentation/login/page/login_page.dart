import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/utils/validators/form_validator.dart';
import 'package:asset_tracker/app/core/widgets/device_padding/device_padding.dart';
import 'package:asset_tracker/app/core/widgets/device_spacing/device_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_view_model/auth_view_model.dart';
import '../../widgets/auth/auth_greet_text.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/form_handlers.dart';
import '../../widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  static String id = AppTexts.loginPageId;

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LogInHelper {
  late final AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: authViewModel.isLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Padding(
                padding: DevicePadding.small.onlyHorizontal,
                child: Form(
                  key: authViewModel.key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(child: AuthGreetText()),
                      DeviceSpacing.large.height,
                      AuthTextFormField.mail(
                        validator: FormValidator.validateEmail,
                        controller: authViewModel.mailController,
                      ),
                      DeviceSpacing.large.height,
                      AuthTextFormField.password(
                        controller: authViewModel.passwordController,
                        validator: FormValidator.validatePassword,
                      ),
                      DeviceSpacing.large.height,
                      LogInButton(
                        onPressed: () => onSignInPressed(authViewModel),
                        text: AppTexts.loginButtonTitle,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
