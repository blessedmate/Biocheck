import 'dart:math';

import 'package:biocheck_flutter/app/data/models/models.dart';
import 'package:biocheck_flutter/app/data/models/template.dart';
import 'package:biocheck_flutter/app/global_widgets/controllers/main_controller.dart';
import 'package:biocheck_flutter/app/modules/evaluations/controllers/evaluations_controller.dart';
import 'package:biocheck_flutter/app/modules/new_evaluation/providers/new_eval_provider.dart';
import 'package:biocheck_flutter/app/providers/sqlite_provider.dart';
import 'package:biocheck_flutter/app/routes/app_pages.dart';
import 'package:biocheck_flutter/app/utils/randomid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:battery_plus/battery_plus.dart';

class NewEvaluationController extends GetxController {
  final provider = NewEvaluationProvider();
  final box = GetStorage();

  final finished = false.obs;
  Location location = Location();
  late Template template;
  final dateController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    template = Get.arguments;
  }

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
    // print(await location.getLocation());

    finished.value = true;
    update();

    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final dueDate = dateController.text;

    final userId = box.read('userId');
    if (dueDate != '' && firstName != '' && lastName != '') {
      Evaluation evaluation = Evaluation(
        patientFirstName: firstName,
        patientLastName: lastName,
        dueDate: dueDate,
        userId: 0,
        template: EvaluationTemplate(name: template.title),
      );
      try {
        final response = await provider.uploadEvaluation(evaluation, userId);

        // Save locally
        response.sent = true;
        await SQLiteProvider.db.saveEvaluation(response);

        // Update UI
        final evaluationsController = Get.find<EvaluationsController>();
        evaluationsController.getUserEvaluations();

        Get.offAndToNamed(Routes.EVALUATIONS);
      } catch (e) {
        // Save locally as an unsent evaluation (queue)
        evaluation.id = RandomId.getRandomString(32);
        evaluation.sent = false;
        await SQLiteProvider.db.saveEvaluation(evaluation);
        print(e);

        final evaluationsController = Get.find<EvaluationsController>();
        evaluationsController.getUserEvaluations();
        Get.offAndToNamed(Routes.EVALUATIONS);
      }
    }
  }

  goToSectionDetail() {
    Get.toNamed(Routes.NEW_EVALUATION_DETAIL);
  }

  // Used to generate random ids
  String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
