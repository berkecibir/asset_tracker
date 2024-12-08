import 'package:asset_tracker/app/core/configs/theme/app_theme.dart';
import 'package:asset_tracker/app/core/routes/app_routes.dart';
import 'package:asset_tracker/app/core/widgets/device_size/device_size.dart';
import 'package:asset_tracker/app/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:asset_tracker/app/presentation/splash/page/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceSize.init(context);
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: Navigation.navigationKey,
      initialRoute: SplashPage.id,
      routes: AppRoutes.routes,
    );
  }
}
