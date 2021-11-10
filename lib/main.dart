import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';

import 'app/global_widgets/controllers/main_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final ThemeData theme =
      ThemeData(fontFamily: 'Airbnb', primaryColor: Palette.primaryColor);

  Get.put(MainController());

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
