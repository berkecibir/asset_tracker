import 'package:asset_tracker/app/core/configs/assets/app_images.dart';
import 'package:asset_tracker/app/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:asset_tracker/app/presentation/login/page/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static String id = 'Splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirectToLogin();
  }

  Duration splashDurationValue() => const Duration(seconds: 2);

  Future<void> redirectToLogin() async {
    await Future.delayed(splashDurationValue());
    Navigation.pushReplace(page: const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.logo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
