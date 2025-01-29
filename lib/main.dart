import 'package:asset_tracker/app/core/configs/theme/app_theme.dart';
import 'package:asset_tracker/app/core/init/app_init.dart';
import 'package:asset_tracker/app/core/routes/app_routes.dart';
import 'package:asset_tracker/app/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:asset_tracker/app/presentation/home/page/home_page.dart';
import 'package:asset_tracker/app/presentation/home_content/page/home_page_content.dart';
import 'package:asset_tracker/app/presentation/profile/page/profile_page.dart';
import 'package:asset_tracker/app/providers/providers_set_up/providers_set_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: "assets/.env");
    debugPrint('ENV yüklendi: ${dotenv.env['SOCKET_URL']}');
    final socketUrl = dotenv.env['SOCKET_URL'];
    debugPrint(
        socketUrl); // uRL doğru mu: "wss://socket.haremaltin.com/socket.io/?EIO=4&transport=websocket"
    /*  debugPrint(dotenv.env['SOCKET_URL']); */
    await AppInit.initialize();
  } catch (e) {
    debugPrint('$e => socket');
  }

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
        initialRoute: HomePage.id,
        routes: AppRoutes.routes,
      ),
    );
  }
}
