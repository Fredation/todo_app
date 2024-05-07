import 'package:flutter/widgets.dart';
import 'package:todo_app/config/app_injection_module.dart';
import 'package:todo_app/config/img_assets.dart';

class AppInitialisation {
  static Future<void> preRun() async {
    WidgetsFlutterBinding.ensureInitialized();

    await registerDependencies();
  }

  static Future<void> postRun([BuildContext? context]) async {
    if (context != null) {
      // Preload the images for improved performance
      precacheImage(const AssetImage(ImgAssets.face), context);
      precacheImage(const AssetImage(ImgAssets.cup), context);
    }
  }
}
