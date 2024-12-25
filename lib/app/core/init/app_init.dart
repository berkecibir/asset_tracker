import 'package:firebase_core/firebase_core.dart';
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
