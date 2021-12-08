import 'dart:math';

import 'package:battery_plus/battery_plus.dart';
import 'package:biocheck_flutter/app/data/models/evaluation.dart';
import 'package:biocheck_flutter/app/data/models/template.dart';
import 'package:biocheck_flutter/app/modules/settings/providers/settings_provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController
    with StateMixin<List<Template>> {
  final box = GetStorage();
  Map<String, dynamic> settings = {};
  Map<String, bool> defaultSettings = {
    "isDarkMode": false,
    "isNotifications": false,
    "isFaceid": false,
    "isBigFont": false,
  };

  @override
  void onInit() {
    settings = box.read('settings') ?? defaultSettings;
    super.onInit();
  }
}
