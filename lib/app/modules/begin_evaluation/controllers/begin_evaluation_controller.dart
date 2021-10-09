import 'package:battery_plus/battery_plus.dart';
import 'package:biocheck_flutter/app/global_widgets/controllers/main_controller.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BeginEvaluationController extends GetxController {
  tapOnEvaluationItem() async {
    final mainController = Get.find<MainController>();
    mainController.startBatteryLevel = await Battery().batteryLevel;
    Get.toNamed(Routes.NEW_EVALUATION);
  }
}
