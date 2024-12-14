import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/utils/validators/form_validator.dart';
import 'package:asset_tracker/app/core/widgets/device_padding/device_padding.dart';
import 'package:asset_tracker/app/core/widgets/device_spacing/device_spacing.dart';
import 'package:asset_tracker/app/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:asset_tracker/app/presentation/home/page/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets/auth/auth_greet_text.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  static String id = AppTexts.loginPageId;

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// login içinde olacaklar
// greeting text
// form => email and password
// button

class _LoginPageState extends State<LoginPage> {
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
    return GestureDetector(
      // ekrana tıklandığında her şeyi kapatır
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
                    controller: mailController),
                DeviceSpacing.large.height,
                AuthTextFormField.password(
                  controller: passwordController,
                  validator: FormValidator.validatePassword,
                ),
                DeviceSpacing.large.height,
                LogInButton(
                  onPressed: () {
                    if (key.currentState?.validate() ?? false) {
                      debugPrint('Form İşlemleri tamamdır');
                      Navigation.pushReplace(page: const HomePage());
                      // form işlemi tamamlanmazsa debugda yazar
                    } else {
                      debugPrint('Form İşlemleri tamamlanamadı');
                    }
                  },
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
