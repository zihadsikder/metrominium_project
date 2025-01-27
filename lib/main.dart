import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:metrominium_project/app/core/config/binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialBinding: IntBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.system,
    ),
  );
}
