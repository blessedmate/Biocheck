import 'package:biocheck_flutter/config.dart';
import 'package:get/get.dart';

class SettingsProvider {
  final bool isDarkMode;
  final bool isNotifications;
  final bool isFaceid;
  final bool isBigFont;

  SettingsProvider(
      {required this.isDarkMode,
      required this.isNotifications,
      required this.isFaceid,
      required this.isBigFont});
}
