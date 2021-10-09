import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      theme: ThemeData(
          fontFamily: 'Airbnb',
          primaryColor: Palette.primaryColor,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            foregroundColor: Palette.primaryColor,
            elevation: 0,
            centerTitle: false,
            titleTextStyle: TypographyStyles.title,
          )),
    ),
  );
}
