import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../widgets/device_size/device_size.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Firebase'i başlat
    await Firebase.initializeApp();

    // .env dosyasını yükle
    // dotenv yüklenirken load path i .env dosyasını kabul etmiyor.
    // sorun asset/.env ile relative path verilerek çözüldü.
    await dotenv.load(fileName: "assets/.env");
  }

  static void initDeviceSize(BuildContext context) {
    DeviceSize.init(context);
  }
}

/* import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../widgets/device_size/device_size.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();
  }

  static void initDeviceSize(BuildContext context) {
    DeviceSize.init(context);
  }
}
 */