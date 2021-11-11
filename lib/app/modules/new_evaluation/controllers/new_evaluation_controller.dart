import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/app/global_widgets/controllers/main_controller.dart';
import 'package:biocheck_flutter/app/modules/new_evaluation/providers/new_eval_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:battery_plus/battery_plus.dart';

class NewEvaluationController extends GetxController {
  final provider = NewEvaluationProvider();

  final finished = false.obs;
  Location location = Location();

  final dateController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  // TODO: ------- THIS GOES INTO NEW_EVAL_DETAIL -----------------
  // final val1 = ''.obs;
  // final val2 = ''.obs;

  // TODO: ------- THIS GOES INTO NEW_EVAL_DETAIL -----------------
  // List<String> options1 = ['CRSwNP', 'AFRS', 'CRSwDD', 'Other'];
  // List<String> options2 = [
  //   'Yes',
  //   'No',
  // ];

  setSelectedDate(DateTime? picked) {
    if (picked != null) {
      dateController.text = picked.toString().split(" ")[0];
    }
  }

  showWarning(TextEditingController textController) {
    return textController.text == '' && finished.value;
  }

  locationIsEnabled() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  submit() async {
    final mainController = Get.find<MainController>();
    print(mainController.startBatteryLevel);
    int finalBattery = await Battery().batteryLevel;
    print('Battery = $finalBattery');
    print(await location.getLocation());

    finished.value = true;
    update();

    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final dueDate = dateController.text;

    if (dueDate != '' && firstName != '' && lastName != '') {
      Evaluation evaluation = Evaluation(
        patientFirstName: firstName,
        patientLastName: lastName,
        dueDate: dueDate,
        // TODO: Get real user ID and template
        userId: 37,
        template: EvaluationTemplate(name: ''),
      );
      final Response response = await provider.uploadEvaluation(evaluation);
      print(response.body);
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
