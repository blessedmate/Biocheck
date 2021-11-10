import 'package:biocheck_flutter/app/global_widgets/controllers/main_controller.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'package:battery_plus/battery_plus.dart';

class NewEvaluationController extends GetxController {
  final finished = false.obs;

  final val = ''.obs;
  final vale = ''.obs;

  List<String> options = ['Crswnp', 'JAIS', 'Hausa', 'Other'];
  List<String> optionsb = [
    'Crswnd',
    'Spfiax',
    'RRoxc',
    'TTreT',
    'Pobpy',
    'LoaYY',
    'MFghSC'
  ];

  showWarning(onChangeValue) {
    return onChangeValue.value == '' && finished.value;
  }

  submit() async {
    final mainController = Get.find<MainController>();
    print(mainController.startBatteryLevel);
    int finalBattery = await Battery().batteryLevel;
    print(finalBattery);

    finished.value = true;
    if (val.value != '' && vale.value != '') {
      Get.back();
      Get.back();
    }
  }
}
