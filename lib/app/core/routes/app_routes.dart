import 'package:asset_tracker/app/presentation/home/page/home_page.dart';
import 'package:asset_tracker/app/presentation/login/page/login_page.dart';
import 'package:asset_tracker/app/presentation/splash/page/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SplashPage.id: (context) => const SplashPage(),
    LoginPage.id: (context) => const LoginPage(),
    HomePage.id: (context) => const HomePage(),
  };
}
