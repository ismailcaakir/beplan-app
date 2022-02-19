// import 'package:app_tracking_transparency/app_tracking_transparency.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import './lang/translate.dart';
import './config/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await AppTrackingTransparency.requestTrackingAuthorization();
  // await Firebase.initializeApp();
  await GetStorage.init("BePlanApp");

  runApp(const BePlan());
}

class BePlan extends StatelessWidget {
  const BePlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(
        builder: (context, child) {
          return MediaQuery(
            child: child!,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          );
        },
      ),
      getPages: PagesConfig.pages,
      translations: Translate(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeConfig.lightTheme,
      initialRoute: RoutesConfig.dashboardPage,
    );
  }
}
