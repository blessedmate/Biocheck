import 'package:biocheck_flutter/app/global_widgets/controllers/main_controller.dart';
import 'package:biocheck_flutter/app/modules/new_evaluation/providers/new_eval_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:battery_plus/battery_plus.dart';

class NewEvaluationController extends GetxController {
  final provider = NewEvaluationProvider();

  final finished = false.obs;

  final dateController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  // TODO: ------- THIS GOES INTO NEW_EVAL_DETAIL -----------------
  final val1 = ''.obs;
  final val2 = ''.obs;

  // TODO: ------- THIS GOES INTO NEW_EVAL_DETAIL -----------------
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

  showWarning(TextEditingController textController) {
    return textController.text == '' && finished.value;
  }

// TODO: ------- THIS GOES INTO NEW_EVAL_DETAIL -----------------
  // showWarning(onChangeValue) {
  //   return onChangeValue.value == '' && finished.value;
  // }

  submit() async {
    final mainController = Get.find<MainController>();
    print(mainController.startBatteryLevel);
    int finalBattery = await Battery().batteryLevel;
    print(finalBattery);

    finished.value = true;
    update();

    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final dueDate = dateController.text;

    if (dueDate != '' && firstName != '' && lastName != '') {
      final Response response =
          await provider.uploadEvaluation(firstName, lastName, dueDate);
      print(response.statusCode);
      Get.offAndToNamed(Routes.EVALUATIONS);
    }
    // TODO: ------- THIS GOES INTO NEW_EVAL_DETAIL -----------------
    // if (val1.value != '' && val2.value != '') {
    //   Get.offAndToNamed(Routes.EVALUATIONS);
    // }
  }

  goToSectionDetail() {
    Get.toNamed(Routes.NEW_EVALUATION_DETAIL);
  }
}
