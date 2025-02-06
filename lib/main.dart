import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sms_sender/core/globals/globals.dart';
import 'package:sms_sender/core/services/sms_service.dart';
import 'package:sms_sender/presentation/ui/pages/sms_page.dart';

import 'core/services/local_storage_service.dart';
import 'core/theme/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await LocalStorageService.init();
  email = await LocalStorageService.getSecureData(key: 'email');
  chatID = await LocalStorageService.getSecureData(key: 'chatID');
  await SmsService.instance.initSmsService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        builder: (_, child) {
          return GetMaterialApp(
            title: 'SMS Bot',
            debugShowCheckedModeBanner: false,
            theme: appTheme,

            //    locale:const Locale('ar'),

            home: const SmsPage(),
          );
        });
  }
}
