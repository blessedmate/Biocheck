import 'package:biocheck_flutter/app/global_widgets/controllers/main_controller.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:battery_plus/battery_plus.dart';

class NewEvaluationController extends GetxController {
  final finished = false.obs;

  final dateController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final val1 = ''.obs;
  final val2 = ''.obs;

  List<String> options1 = ['CRSwNP', 'AFRS', 'CRSwDD', 'Other'];
  List<String> options2 = [
    'Yes',
    'No',
  ];

  setSelectedDate(DateTime? picked) {
    if (picked != null) {
      dateController.text = picked.toString().split(" ")[0];
    }
  }

  showWarning(onChangeValue) {
    return onChangeValue.value == '' && finished.value;
  }

  submit() async {
    final mainController = Get.find<MainController>();
    print(mainController.startBatteryLevel);
    int finalBattery = await Battery().batteryLevel;
    print(finalBattery);

    finished.value = true;
    if (val1.value != '' && val2.value != '') {
      Get.offAndToNamed(Routes.EVALUATIONS);
    }
  }

  goToSectionDetail() {
    Get.toNamed(Routes.NEW_EVALUATION_DETAIL);
  }
}
