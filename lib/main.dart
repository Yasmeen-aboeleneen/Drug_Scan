import 'package:drug_scan_app/Core/Utils/notification_helper.dart';
import 'package:drug_scan_app/Localization/lo_controller.dart';
import 'package:drug_scan_app/Localization/localization.dart';
import 'package:drug_scan_app/Views/Auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;
import 'package:get/get.dart';

void setupTimezone() {
  // Initialize timezone data and set the local location
  tz.initializeTimeZones();
  tz.setLocalLocation(
      tz.getLocation('Africa/Cairo')); // Adjust timezone as needed
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupTimezone(); // Initialize timezone
  initializeNotifications(); // Initialize notifications
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  Get.put(MyLoController()); // Initialize MyLoController
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MyLoController controller = Get.find<MyLoController>();
    return GetMaterialApp(
      locale: controller.initialLang, // استخدام اللغة المحفوظة
      translations: MyLocalization(),
      debugShowCheckedModeBanner: false,
      title: 'Drug Scan',
      home: const Auth(),
    );
  }
}
