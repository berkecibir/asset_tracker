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
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    Future _onSignInPressed() async {
      await handleSignUp(
        authViewModel: authViewModel,
        formKey: key,
        emailController: mailController,
        passwordController: passwordController,
        context: context,
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: DevicePadding.small.onlyHorizontal,
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(child: AuthGreetText()),
                DeviceSpacing.large.height,
                AuthTextFormField.mail(
                  validator: FormValidator.validateEmail,
                  controller: mailController,
                ),
                DeviceSpacing.large.height,
                AuthTextFormField.password(
                  controller: passwordController,
                  validator: FormValidator.validatePassword,
                ),
                DeviceSpacing.large.height,
                LogInButton(
                  onPressed: _onSignInPressed,
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
