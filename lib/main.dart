import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'BioCheck App',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(fontFamily: 'Airbnb', primaryColor: Palette.primaryColor),
    ),
  );
}
