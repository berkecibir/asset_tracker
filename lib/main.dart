import 'package:asset_tracker/app/core/configs/theme/app_theme.dart';
import 'package:asset_tracker/app/core/init/app_init.dart';
import 'package:asset_tracker/app/core/routes/app_routes.dart';
import 'package:asset_tracker/app/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:asset_tracker/app/presentation/splash/page/splash_page.dart';
import 'package:asset_tracker/app/providers/providers_set_up/providers_set_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await AppInit.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppInit.initDeviceSize(context);
    return MultiProvider(
      providers: ProvidersSetUp.providers,
      child: MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        navigatorKey: Navigation.navigationKey,
        initialRoute: SplashPage.id,
        routes: AppRoutes.routes,
      ),
    );
  }
}
