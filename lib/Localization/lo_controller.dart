import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLoController extends GetxController {
  late SharedPreferences sharepref;
  Locale? initialLang;

  @override
  void onInit() async {
    super.onInit();
    await initSharedPreferences();
    loadSavedLang(); // تحميل اللغة المحفوظة
  }

  Future<void> initSharedPreferences() async {
    sharepref = await SharedPreferences.getInstance();
  }

  void loadSavedLang() {
    String? savedLang = sharepref.getString("lang");
    if (savedLang != null) {
      initialLang = Locale(savedLang); // تعيين اللغة المحفوظة
    } else {
      initialLang = Locale('en'); // اللغة الافتراضية
    }
  }

  void changeLang(String codeLang) async {
    Locale currentLocal = Locale(codeLang);
    await sharepref.setString("lang", codeLang); // حفظ اللغة الجديدة
    Get.updateLocale(currentLocal); // تحديث اللغة في التطبيق
  }
}