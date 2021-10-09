import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  final ThemeData theme =
      ThemeData(fontFamily: 'Airbnb', primaryColor: Palette.primaryColor);

  runApp(
    GetMaterialApp(
        title: 'BioCheck App',
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme:
              theme.colorScheme.copyWith(secondary: Palette.primaryColor),
        )),
  );
}
