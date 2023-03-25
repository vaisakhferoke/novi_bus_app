import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:novi_bus_app/utils/settings.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Moovbe",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppUiSettings().primaryColor,
        fontFamily: 'axiforma',
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: AppUiSettings().primaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff2B2B2B),
        ),
      ),
    ),
  );
}
